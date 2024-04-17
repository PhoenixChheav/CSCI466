<!-- https://students.cs.niu.edu/~z1966108/assign9.php -->
<html lang="en">
    <head>
        <title>Phoenix Z1966108</title>
    </head>
<body>
    <h1 style="text-align: center">
        CSCI 466 Assignment 9
    </h1>

    <form method="POST" action="">
        <label for="word">Word: </label>
        <input type="text" name="word" id="word"><br><br>

        <label for="count">Count: </label>
        <input type="number" name="count" id="count"><br><br>

        <label>List Type:</label><br>
        <input type="radio" name="listtype" id="ordered" value="ordered">
        <label for="ordered">Ordered</label> <br>
        <input type="radio" name="listtype" id="unordered" value="unordered">
        <label for="unordered">Unordered</label><br><br>

        <label for="numstart">Start: </label>
        <select name="numstart" id="numstart">
            <?php for ($i = 0; $i <= 9; $i++){?>
                <option value="<?php echo $i ?>">
                    <?php echo $i ?>
                </option>
            <?php }?>
        </select><br><br>

        <label for="numstep">Step: </label>
        <select name="numstep" id="numstep">
            <?php for ($i = 0; $i <= 9; $i++){?>
                <option value="<?php echo $i ?>">
                    <?php echo $i ?>
                </option>
            <?php }?>
        </select><br><br>

        <label for="numnums">Count: </label>
        <select name="numnums" id="numnums">
            <?php for ($i = 0; $i <= 9; $i++){?>
                <option value="<?php echo $i ?>">
                    <?php echo $i ?>
                </option>
            <?php }?>
        </select><br><br>

        <input type="submit" value="LET'S GOOOO">
    </form>

    <?php
        // check if the form was submitted
        if($_SERVER["REQUEST_METHOD"] == "POST"){
            //Validate form inputs
            $word = $_POST['word'];
            $count = $_POST['count'];
            $listtype = $_POST['listtype'];

            if(empty($word) || empty($count) || empty($listtype)){
                echo "<p>List display parameters not received.</p>";
            }else{
                if(!preg_match("/^\w+$/", $word)){
                    echo "<p>Word must be a single word.</p>";
                }elseif(!is_numeric($count) || $count < 0){
                    echo "<p>Count must be a non-negative integer.</p>";
                }elseif($listtype !== "ordered" && $listtype !== "unordered"){
                    echo "<p>Invalid list type.</p>";
                }else{
                    //if the list is valid
                    echo "<$listtype>";
                    if($listtype == "unordered"){ // if listtype is ordered list
                        echo "<ul>"; 
                        for($i = 0; $i < $count; $i++){
                            echo "<li>$word</li>";
                        }
                        echo "</ul>";
                    }else{ // if listtype is ordered list
                        echo "<ol>";
                        for($i = 0; $i < $count; $i++){
                            echo "<li>$word</li>";
                        }
                        echo "</ol>";
                    }
                    echo "</$listtype>";
                }
            }


            $numstart = $_POST['numstart'];
            $numstep = $_POST['numstep'];
            $numnums = $_POST['numnums'];

            if(empty($numstart) || empty($numstep) || empty($numnums)){
                echo "<p>Multiplication paramaters not recieved.</p>";
            }else{
                // Draw multiplication table
                echo "<table border='1'>";

                // Table header row
                echo "<tr>";
                echo "<th></th>"; // Empty cell for the top-left corner
                for ($j = 0; $j < $numnums; $j++) {
                    echo "<th>" . ($numstart + $j * $numstep) . "</th>";
                }
                echo "</tr>";

                // Table data rows
                for ($i = 0; $i < $numnums; $i++) {
                    echo "<tr>";
                    echo "<th>" . ($numstart + $i * $numstep) . "</th>"; // Row header cell
                    for ($j = 0; $j < $numnums; $j++) {
                        echo "<td>" . (($numstart + $i * $numstep) * ($numstart + $j * $numstep)) . "</td>"; // Table data cell
                    }
                    echo "</tr>";
                }
                echo "</table>";
            }          
        }  
    ?>
</body>
</html>