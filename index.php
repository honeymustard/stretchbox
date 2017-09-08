<!DOCTYPE html>
<html>
    <head>
        <title>Stretchbox</title>
        <style>
            *, *:before, *:after {
                box-sizing: border-box;
            }

            body {
                background-color: #fff;
                color: #000;
                font-family: Monospace, sans-serif;
                margin: 0;
                padding: 40px 0 0;
            }

            h1 {
                font-size: 30px;
                line-height: 36px;
            }

            h1, h2, h3, h4, h5, h6 {
                color: #07d;
                margin: 0 0 10px;
            }

            h2, h3, h4, h5 {
                font-size: 24px;
                line-height: 29px;
                margin: 0 0 10px;
            }

            p {
                margin: 0 0 10px;
            }

            b {
                font-weight: 600;
            }

            .intro {
                font-size: 19px;
                line-height: 26px;
                margin: 0 0 40px;
            }

            .para {
                font-size: 16px;
                line-height: 21px;
            }

            .main {
                max-width: 800px;
                margin: 0 auto;
            }

            .block {
                margin: 0 0 40px;
            }

            ul {
                margin: 10px 0;
                list-style-type: none;
                padding: 0;
            }

            li {
                font-size: 16px;
                line-height: 21px;
                padding: 0 0 0 20px;
                position: relative;
            }

            li:before {
                background-color: #07d;
                border-radius: 50%;
                content: '';
                display: inline-block;
                height: 5px;
                width: 5px;
                position: absolute;
                left: 2px;
                top: 7px;
            }
        </style>
    </head>

    <body>
        <div class="main">
            <h1>Stretchbox</h1>

            <p class="intro">A simple LEMP stack for Debian 9</p>

            <div class="block">
                <h3>Debian</h3>
                <p class="para">Debian GNU/Linux 9 "Stretch"</p>
            </div>

            <div class="block">
                <h3>Nginx</h3>
                <ul>
                    <li><b>host</b> stretchbox.dev</li>
                    <li><b>addr</b> 192.168.33.10</li>
                </ul>
            </div>

            <?php $db = new Mysqli('localhost', 'root', 'root', 'mysql'); ?>

            <div class="block">
                <h3>MariaDB</h3>
                <p class="para">Status: <?php echo $db->connect_errno ? 'Not connected' : 'Connected'; ?></p>
                <ul>
                    <li><b>host</b> localhost</li>
                    <li><b>user</b> root</li>
                    <li><b>pass</b> root</li>
                </ul>
            </div>

            <div class="block">
                <h3>PHP</h3>
                <p class="para">Version <?php echo PHP_VERSION; ?></p>
            </div>
        </div>
    </body>
</html>
