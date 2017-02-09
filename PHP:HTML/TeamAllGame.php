<head>
  <title> TeamAllGame</title>
 </head>
 <body>
 
 <?php

include 'open.php';

$club = $_POST['club'];
$mysqli->multi_query("CALL TeamAllGame('".$club."');"); 
$res = $mysqli->store_result();
if ($res) {
      echo "<table border=1>\n";
      echo "<tr><td>Season</td><td>Date</td><td>Home</td><td>Away</td><td>Score</td></tr>\n";
        while ($myrow = mysqli_fetch_array($res)) {
          printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>\n", $myrow["Season"], $myrow["Date"], $myrow["Home"], $myrow["Away"], $myrow["Score"]);
        }
        echo "</table>\n";
    }
$mysqli->close();


?>
</body>
