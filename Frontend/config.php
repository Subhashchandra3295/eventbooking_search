<?php

$dsn = 'mysql:host=127.0.0.1;dbname=eventbooking';
$user = 'root';
$password = '';

try {
	$pdo = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
	echo 'Connection failed: ' . $e->getMessage();
	die();
}

?>
