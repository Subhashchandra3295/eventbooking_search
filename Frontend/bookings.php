<?php
require 'config.php';

<<<<<<< HEAD
=======

>>>>>>> 185fc17 (Completed Design of Frontend web application - Insert, Filter, and Reset)
// Set default values for filters
$employee_name = isset($_POST['employee_name']) ? $_POST['employee_name'] : '';
$event_name = isset($_POST['event_name']) ? $_POST['event_name'] : '';
$event_date = isset($_POST['event_date']) ? $_POST['event_date'] : '';

// Build the SQL query with the filters
$sql = "SELECT employees.employee_name, events.event_name, events.event_date, participations.participation_fee
        FROM participations
<<<<<<< HEAD
        INNER JOIN employees ON employees.employee_id = participations.employee_id
        INNER JOIN events ON events.event_id = participations.event_id";
=======
        INNER JOIN employees ON employees.id = participations.employee_id
        INNER JOIN events ON events.id = participations.event_id";
>>>>>>> 185fc17 (Completed Design of Frontend web application - Insert, Filter, and Reset)

if ($employee_name !== '') {
    $sql .= " AND employees.employee_name LIKE '%$employee_name%'";
}

if ($event_name !== '') {
    $sql .= " AND events.event_name LIKE '%$event_name%'";
}

if ($event_date !== '') {
    $sql .= " AND DATE(events.event_date) LIKE '%$event_date%'";
}

// Execute the SQL query and display the results
$stmt = $pdo->query($sql);
$total_fee = 0;

?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Bookings</title>
    <link rel="stylesheet" type="text/css" href="bookings.css">
</head>
<body>
    <h1>Event Bookings</h1>
    <form method="post" action="">
        <label for="employee_name">Employee Name:</label>
        <input type="text" id="employee_name" name="employee_name" value="<?php echo $employee_name; ?>"><br><br>

        <label for="event_name">Event Name:</label>
        <input type="text" id="event_name" name="event_name" value="<?php echo $event_name; ?>"><br><br>

        <label for="event_date">Event Date:</label>
        <input type="date" id="event_date" name="event_date" value="<?php echo $event_date; ?>"><br><br>

        <input type="submit" value="Filter">
        <input type="reset" value="Clear" name="reset" onclick="window.location='bookings.php'">
    </form>

    <br>

    <table>
        <thead>
            <tr>
                <th>Employee Name</th>
                <th>Event Name</th>
                <th>Event Date</th>
                <th>Participation Fee</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $stmt->fetch(PDO::FETCH_ASSOC)): ?>
                <tr>
                    <td><?php echo $row['employee_name']; ?></td>
                    <td><?php echo $row['event_name']; ?></td>
                    <td><?php echo date('Y-m-d H:i:s', strtotime($row['event_date'])); ?></td>
                    <td><?php echo $row['participation_fee']; ?></td>
                </tr>
                <?php $total_fee += $row['participation_fee']; ?>
            <?php endwhile; ?>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="3">Total:</td>
                <td><?php echo $total_fee; ?></td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
