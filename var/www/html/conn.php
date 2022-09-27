<?php
$servername = "10.10.20.15";
$username = "vagrant";
$password = "vagrantpass";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "<h1>PHP test connection</h1>";
echo "Connected to " . $servername;
?>