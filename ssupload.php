<?php
require_once "includes/config.php";
require_once "includes/database.php";
#require_once "includes/rrd.php";

$result = json_decode(file_get_contents("php://input"));

$query = $db->prepare("SELECT id, rrdstep FROM servers WHERE id = ? AND passkey = ?");
$query->execute(array($result->uid, sha1($result->key)));

if($query->rowCount() == 0) {
	die("unauthorized");
}

$info = $query->fetch(PDO::FETCH_OBJ);

$fields = array(
	'time',
	'uptime',
	'status',
	'memtotal', 'memused', 'memfree', 'membuffers',
	'disktotal', 'diskused', 'diskfree',
	'load1', 'load5', 'load15',
	'interfaces',
	'processes'
);

$fieldarr = array();
foreach($fields as $field) {
	$fieldarr[] = $field . ' = ?';
}

# Create record in current stats if not already exists.
$dbq = $db->prepare('INSERT IGNORE INTO stats_current (`serverid`) VALUES (?)');
$dbq->execute(array(intval($result->uid)));

# Update current stats.
$dbq = $db->prepare('UPDATE stats_current SET ' . implode(', ', $fieldarr) . ' WHERE serverid = ?');

$data = array(
	//Time
	time(),
	//Uptime
	$result->uplo->uptime,
	//Status
	true,
	//Memory
	$result->ram->total, 
	$result->ram->used, 
	$result->ram->free, 
	$result->ram->bufcac, 
	//Disk
	$result->disk->total->total, 
	$result->disk->total->used, 
	$result->disk->total->avail,
	//Loads
	$result->uplo->load1, 
	$result->uplo->load5, 
	$result->uplo->load15,
	//Interfaces
	isset($result->interfaces) ? json_encode($result->interfaces) : '',
	//Processes
	json_encode($result->ps),
	//Server ID
	intval($result->uid)
);

if(!$dbq->execute($data)) {
	error_log(print_r($dbq->errorInfo(), true));
}


# Insert into stats history.
$qry = sprintf('INSERT INTO stats_history (%s, serverid) VALUES (%s ?)',
		implode(', ', $fields), str_repeat('?, ', count($fields)));

$dbq = $db->prepare($qry);

if(!$dbq->execute($data)) {
	error_log(print_r($dbq->errorInfo(), true));
}


// Update the rrd databases

#$rrd = new StatusRRD($result->uid, $info->rrdstep);
#$rrd->update($result);
?>