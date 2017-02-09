<head>
  <title> BestInYear</title>
 </head>
 <body>
 
 <?php

include 'open.php';

$player = $_POST['player'];
$year = $_POST['year'];
$mysqli->multi_query("CALL BestInYEar(".$year.");"); 
$res = $mysqli->store_result();
if ($res) {
      echo "<table border=1>\n";
      echo "<tr><td>Club</td><td>League</td><td>Season</td></tr>\n";
        while ($myrow = mysqli_fetch_array($res)) {
          printf("<tr><td>%s</td><td>%s</td><td>%s</td></tr>\n", $myrow["Club"], $myrow["League_Name"], $myrow["Season"]);
        }
        echo "</table>\n";
    }
$mysqli->close();


?>
</body>
