<head>
  <title> Individual_Club_Game_History</title>
 </head>
 <body>
 
 <?php

include 'open.php';

$club = $_POST['club'];
$mysqli->multi_query("CALL Individual_Club_Game_History('".$club."');"); 
$res = $mysqli->store_result();
if ($res) {
      echo "<table border=1>\n";
      echo "<tr><td>Season</td><td>Club</td><td>Against</td><td>Score</td></tr>\n";
        while ($myrow = mysqli_fetch_array($res)) {
          printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n", $myrow["Season"], $myrow["Club"], $myrow["Against"], $myrow["Score"]);
        }
        echo "</table>\n";
    }
$mysqli->close();


?>
</body>
