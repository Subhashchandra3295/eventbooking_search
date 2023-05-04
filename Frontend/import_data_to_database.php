<?php

require 'config.php';

// read JSON data from file
$jsondata = file_get_contents("DEVEvents.json");

// decode JSON data into an array
$bookings = json_decode($jsondata, true);

// loop through the array and insert records into tables
foreach ($bookings as $booking) 
{
  // Convert the event date to UTC if the version is newer than 1.0.17+60
  $eventDate = new DateTime($booking['event_date']);
  if (version_compare($booking['version'], '1.0.17+60', '>=')) {
      $eventDate->setTimezone(new DateTimeZone('UTC'));
  }
  
  // Insert or update the employee
  $stmt = $pdo->prepare('INSERT IGNORE INTO employees (employee_name, employee_mail) VALUES (:employee_name, :employee_mail)');
  $employeeInserted = $stmt->execute([
      'employee_name' => $booking['employee_name'],
      'employee_mail' => $booking['employee_mail']
  ]);
  $employeeId = $pdo->lastInsertId() ?: $pdo->query("SELECT employee_id FROM employees WHERE employee_mail = '{$booking['employee_mail']}'")->fetch()['employee_id'];

  // Insert or update the event
  $stmt = $pdo->prepare('INSERT IGNORE INTO events (event_name, event_date) VALUES (:event_name, :event_date)');
  $eventInserted = $stmt->execute([
      'event_name' => $booking['event_name'],
      'event_date' => $eventDate->format('Y-m-d H:i:s')
  ]);
  $eventId = $pdo->lastInsertId() ?: $pdo->query("SELECT event_id FROM events WHERE event_name = '{$booking['event_name']}'")->fetch()['event_id'];

  // Insert the participation
  $stmt = $pdo->prepare('INSERT IGNORE INTO participations (employee_id, event_id, participation_fee) VALUES (:employee_id, :event_id, :participation_fee)');
  $participationInserted = $stmt->execute([
      'employee_id' => $employeeId,
      'event_id' => $eventId,
      'participation_fee' => $booking['participation_fee']
  ]);

  if ($participationInserted) {
    echo "Success: Data added for {$booking['employee_name']} in {$booking['event_name']} event.\n";
  } else {
    echo "Error: Data already exists for {$booking['employee_name']} in {$booking['event_name']} event.\n";
  }
}

?>
