<head>
  <title> Winning_Odds</title>
 </head>
 <body>
 
 <?php

include 'open.php';

$club = $_POST['club'];

$mysqli->multi_query("CALL Winning_Odds('".$club."');"); 
$res = $mysqli->store_result();
if ($res) {
      echo "<table border=1>\n";
      echo "<tr><td>Home</td><td>Club</td><td>Win</td><td>Draw</td><td>Lose</td></tr>\n";
        while ($myrow = mysqli_fetch_array($res)) {
          printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n", $myrow["Home"], $myrow["Club_Name"], $myrow["Win"], $myrow["Draw"], $myrow["Lose"]);
        }
        echo "</table>\n";
    }
$mysqli->close();


?>
</body>
