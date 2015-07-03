<html>
<head>
	<title>Server Security - Status Upload</title>
</head>
<body>
	<pre>
		<?php print_r(json_decode(file_get_contents("php://input"))); ?>
	</pre>
</body>
</html>
