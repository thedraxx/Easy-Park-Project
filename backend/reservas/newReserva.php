<?php
//CREA INSTANCIA DE RESERVA
require "reserva.php";
require 'token.php';


if(isset($_POST['cod_cliente'])&& $_POST['cod_cliente'] != " "){
    $reserva = new Reserva();
    //$reserva = CrearReserva($token,1,1,"GBC916","2022-09-10 22:00:00","2022-09-10 23:00:00");
    $reserva->CrearReserva(generar_token(),$_POST['cod_cliente'],$_POST['cod_estac'],$_POST['patente'],$_POST['ingreso'],$_POST['salida']);
}else{
    echo "Error! sin datos";
}



?>