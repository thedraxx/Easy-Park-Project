<?php
//OBTENER FECHA ACTUAL 
function getDatetimeNow() {
    $tz_object = new DateTimeZone('America/Argentina/Buenos_Aires');
    $datetime = new DateTime();
    $datetime->setTimezone($tz_object);
    return $datetime->format('Y\-m\-d\ G:i:s');
}
?>