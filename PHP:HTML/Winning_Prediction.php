<head>
  <title> Winning_Prediction</title>
 </head>
 <body>
 
 <?php

include 'open.php';

$club1 = $_POST['club1'];
$club2 = $_POST['club2'];
$mysqli->multi_query("CALL Winning_Prediction('".$club1."', '".$club2."');"); 
$res = $mysqli->store_result();
if ($res) {
      echo "<table border=1>\n";
      echo "<tr><td>Team1</td><td>Team2</td><td>Winning Probability</td></tr>\n";
        while ($myrow = mysqli_fetch_array($res)) {
          printf("<tr><td>%s</td><td>%s</td><td>%s</td></tr>\n", $myrow["Team1"], $myrow["Team2"], $myrow["Team1_Win_Possibility"]);
        }
        echo "</table>\n";
    }
$mysqli->close();


?>
</body>
