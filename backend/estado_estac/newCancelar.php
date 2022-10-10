<?php

require "estado.php";

if(isset($_POST['token']) && strlen($_POST['token']) == 6){
    $operacion = new EstadoEstac();
    $operacion->Cancelar($_POST['token']);
}else{
    echo "sin datos";
}


#$fecha = new DateTime('2022-10-09 13:28');
//$time = floatval(time() + ( 0* 0 * 1 * 00));
//time_sleep_until(time() + $time);
?>