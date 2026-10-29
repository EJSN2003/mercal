<?php
$c = new PDO('mysql:host=localhost;dbname=mercal1', 'root', '');
foreach(['tblmedicamentos','tblbeneficiario','tblcontrolenfermeria'] as $t){
    echo "TABLE $t\n";
    foreach($c->query("SHOW COLUMNS FROM $t") as $row){
        echo $row['Field']."\n";
    }
    echo "---\n";
}
