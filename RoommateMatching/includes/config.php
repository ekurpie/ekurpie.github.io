<?php
/*
Database configuration
*/

$DB_NAME = "mis565_dev"; # Update to your database name if needed
$USERNAME = "root"; # Default MySQL user
$PASSWORD = ""; # Default root password
$HOST = "localhost";
$URL = "$HOST/public_html/RoommateMatching";

$DB_CONN = mysqli_connect($HOST, $USERNAME, $PASSWORD, $DB_NAME);
/*$URLS = array(
        "baseUrl" => "http://mis565.amruss.ventures")*/
/*$PATHS => array(
        "resources" => "/path/to/resources",
        "images" => array(
            "content" => $_SERVER["DOCUMENT_ROOT"] . "/images/content",
            "layout" => $_SERVER["DOCUMENT_ROOT"] . "/images/layout")
    )
);*/

/*
	Error reporting
*/
ini_set("error_reporting", "true");
error_reporting(E_ALL|E_STRICT);

?>
