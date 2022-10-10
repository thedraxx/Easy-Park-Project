<?php
//CREA INSTANCIA DE CONSULTA DATOS DE RESERVA INGRESANDO TOKEN
require "reserva.php";

if(isset($_POST['token']) && strlen($_POST['token']) == 6 && $_POST["tipo"]){
    $token = trim($_POST['token']);
    $operacion = new Reserva();
   // $operacion->tipoOperacion($token,$_POST["tipo"]);

}else{
    echo "token no valido";
}

?>