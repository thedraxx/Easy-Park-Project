<?php
//CREA INSTANCIA DE CONSULTA DATOS DE RESERVA INGRESANDO TOKEN
require "reserva.php";

if(isset($_POST['token']) && strlen($_POST['token']) == 6){
    $token = trim($_POST['token']);
    $nueva = new Reserva();
    $nueva->MostrarReserva($token);

}else{
    echo "token no valido";
}

?>