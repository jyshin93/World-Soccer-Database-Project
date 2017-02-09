<head>
  <title>PlayerInYear</title>
 </head>
 <body>
 
 <?php

include 'open.php';

$player = $_POST['player'];
$year = $_POST['year'];
$mysqli->multi_query("CALL PlayerInYear('".$player."',".$year.");"); 
$res = $mysqli->store_result();
if ($res) {
      echo "<table border=1>\n";
      echo "<tr><td>Player</td><td>Season</td><td>League</td><td>Team</td><td>No.</td></tr>\n";
        while ($myrow = mysqli_fetch_array($res)) {
          printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n", $myrow["Player"], $myrow["Season"], $myrow["League_Name"], $myrow["Team"], $myrow["Num"]);
        }
        echo "</table>\n";
    }
$mysqli->close();


?>
</body>
