<head>
  <title> Game_History</title>
 </head>
 <body>
 
 <?php

include 'open.php';

$club1 = $_POST['club1'];
$club2 = $_POST['club2'];
$mysqli->multi_query("CALL Game_History('".$club1."', '".$club2."');"); 
$res = $mysqli->store_result();
if ($res) {
      echo "<table border=1>\n";
      echo "<tr><td>Season</td><td>Home</td><td>Away</td><td>HomeScore</td><td>AwayScore</td></tr>\n";
        while ($myrow = mysqli_fetch_array($res)) {
          printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n", $myrow["Season"], $myrow["Home_T"], $myrow["Away_T"], $myrow["Home_S"], $myrow["Away_S"]);
        }
        echo "</table>\n";
    }
$mysqli->close();


?>
</body>
