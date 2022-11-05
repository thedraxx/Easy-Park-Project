<?php
//CREA INSTANCIA DE CONSULTA DATOS DE RESERVA INGRESANDO TOKEN
require "estado.php";

if(isset($_POST['token']) && strlen($_POST['token']) == 6){
    $token = trim($_POST['token']);
    $nueva = new EstadoEstac();
    $nueva->MostrarReserva($token);
}else{
    echo "token no valido";
}

?>