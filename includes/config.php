<?php
error_reporting(E_ALL);

define("STATUS_VERSION", "1.0.0");

$config = array(
	'display' => array(
		'nobuffers' => true
	),
	'accepted_fs' => array(
		'/dev/simfs'
	)
);

$config['database'] = array('type'		=> 'mysql',
							'hostname'	=> $_ENV['OPENSHIFT_MYSQL_DB_HOST'],
							'username'	=> $_ENV['OPENSHIFT_MYSQL_DB_USERNAME'],
							'password'	=> $_ENV['OPENSHIFT_MYSQL_DB_PASSWORD'],
							'database'	=> 'ss'
							);

# Set default timezone
$config['timezone'] = 'Asia/Kathmandu';

putenv('TZ=' . $config['timezone']);
date_default_timezone_set($config['timezone']);

?>