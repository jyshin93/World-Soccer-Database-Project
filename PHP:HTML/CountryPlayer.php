<head>
  <title>CountryPlayer</title>
 </head>
 <body>
 
 <?php

include 'open.php';

$country = $_POST['country'];
$mysqli->multi_query("CALL CountryPlayer('".$country."');"); 
$res = $mysqli->store_result();
if ($res) {
      echo "<table border=1>\n";
      echo "<tr><td>Player</td><td>Team</td><td>Season</td><td>League</td></tr>\n";
        while ($myrow = mysqli_fetch_array($res)) {
          printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n", $myrow["player"], $myrow["Team"], $myrow["season"], $myrow["League_Name"]);
        }
        echo "</table>\n";
    }
$mysqli->close();

?>
</body>
