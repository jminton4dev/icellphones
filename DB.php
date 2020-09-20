


 <?php 
$link = mysql_connect('cellphonescom.ipagemysql.com', 'cellphones', '*password*'); 
if (!$link) { 
    die('Could not connect: ' . mysql_error()); 
} 
echo 'Connected successfully'; 
mysql_select_db(whmcs); 
?> 
