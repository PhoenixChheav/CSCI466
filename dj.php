<html>
    <center>
    <head><title>Karafun DJ Interface</title></head>
    <body>
        <h1>Karafun DJ Interface</h1>
        <?php
        $counter = 0;
        header("refresh: 5;");
            try{
                // Connect to the database
                $dsn = 'mysql:host=courses;dbname=z1983312';
                $pdo = new PDO($dsn, 'z1983312', '1990Aug24');
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                        $sqlshowlist = "SELECT QNUM, TITLE, REQUEST.NAME, AMOUNTPAID
                                        FROM REQUEST, SONG, SINGER
                                        WHERE HASPAID = 1
                                        AND REQUEST.TRACKNUM = SONG.TRACKNUM
                                        AND REQUEST.NAME = SINGER.NAME
                                        ORDER BY AMOUNTPAID DESC, QNUM ASC";
                        $prepared = $pdo->prepare($sqlshowlist);
                        $result = $prepared->execute();
                        if($result)
                        {
                            $queue = $prepared->fetchAll();
                            echo "Accelerated Queue";
                            echo "<table border=1>";
                            echo "<tr><th>Queue Number</th><th>Song Name</th><th>Stage Name</th><th>Amount Paid</th></tr>";

                            foreach($queue as $row)
                            {
                                echo "<tr>";
                                echo "<td>".$row['QNUM']."</td>";
                                echo "<td>".$row['TITLE']."</td>";
                                echo "<td>".$row['NAME']."</td>";
                                echo "<td>".$row['AMOUNTPAID']."</td>";
                                echo "</tr>";
                            }
                            echo "</table>";
                        }
                    echo "<form method='post' action='Karafundjinterface.php'>";
                    echo "<input type='submit' name='PlayACQ' value='Play from Acclerated Queue'/>";
                    echo "</form>";
                    if(ISSET($_POST['PlayACQ'])){
                        $sqlplay = "DELETE FROM REQUEST WHERE HASPAID = 1
                                                        AND QNUM = (SELECT MIN(QNUM) FROM REQUEST WHERE HASPAID = 1 AND AMOUNTPAID = (SELECT MAX(AMOUNTPAID) FROM REQUEST WHERE HASPAID = 1))";

                        $prepared = $pdo->prepare($sqlplay);
                        $result = $prepared->execute();
                        if($result){
                            header("Location: Karafundjinterface.php");
                        }else{
                            echo "<p>Song Not Played</p>";
                        }
                    }
                    echo "<br/>";
                    echo "<br/>";
                    
                    $sqlshowlist = "SELECT QNUM, TITLE, REQUEST.NAME
                                        FROM REQUEST, SONG, SINGER
                                        WHERE HASPAID = 0
                                        AND REQUEST.TRACKNUM = SONG.TRACKNUM
                                        AND REQUEST.NAME = SINGER.NAME
                                        ORDER BY QNUM ASC";
                        $prepared = $pdo->prepare($sqlshowlist);
                        $result = $prepared->execute();
                        if($result){
                            $queue = $prepared->fetchAll();
                            echo "Free Queue";
                            echo "<table border =1>";
                            echo "<tr><th>Queue Number</th><th>Song Name</th><th>Stage Name</th></tr>";

                            foreach($queue as $row){
                                echo "<tr>";
                                echo "<td>".$row['QNUM']."</td>";
                                echo "<td>".$row['TITLE']."</td>";
                                echo "<td>".$row['NAME']."</td>";
                                echo "</tr>";
                            }
                            echo "</table>";
                        }
                        echo "<form method='post' action='Karafundjinterface.php'>";
                        echo "<input type='submit' name='PlayFQ' value='Play from Free Queue'/>";
                        echo "</form>";
                        if(ISSET($_POST['PlayFQ'])){
                            $sqlplay = "DELETE FROM REQUEST WHERE HASPAID = 0
                                                            AND QNUM = (SELECT MIN(QNUM) FROM REQUEST WHERE HASPAID = 0)";
    
                            $prepared = $pdo->prepare($sqlplay);
                            $result = $prepared->execute();
                            if($result){
                                header("Location: Karafundjinterface.php");
                            }else{
                                echo "<p>Song Not Played</p>";
                            }
                        }
                } catch (PDOException $e) {
                echo 'Connection failed: ' . $e->getMessage();
            }
        ?>
    </body>
  </center>
</html>