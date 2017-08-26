<!DOCTYPE html>
<head>
    <title>Stretchbox</title>
</head>
<html>
    <body>
        <h2>Stretchbox</h2>

        <?php
        $db = new Mysqli('localhost', 'root', 'root', 'mysql');

        if ($db->connect_errno) {
            echo '<h3>Mysqli failed</h3>';
            echo $db->connect_errno . ' - ' . $db->connect_error;
        } else {
            echo '<h3>Mysqli connected</h3>';
            echo $db->host_info;
        }
        ?>
    </body>
</html>
