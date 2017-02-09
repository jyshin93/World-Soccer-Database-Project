<head>
  <title>EventCountry</title>
 </head>
 <body>
 
 <?php

include 'open.php';

$country = $_POST['country'];
$mysqli->multi_query("CALL EventCountry('".$country."');"); 
$res = $mysqli->store_result();
if ($res) {
      echo "<table border=1>\n";
      echo "<tr><td>Year</td><td>Location</td><td>Champion</td></tr>\n";
        while ($myrow = mysqli_fetch_array($res)) {
          printf("<tr><td>%s</td><td>%s</td><td>%s</td></tr>\n", $myrow["Year"], $myrow["Location"], $myrow["Champion"]);
        }
        echo "</table>\n";
    }
$mysqli->close();


?>
</body>
