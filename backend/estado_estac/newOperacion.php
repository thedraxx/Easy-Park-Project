<?php
//CREA INSTANCIA DE CONSULTA DATOS DE RESERVA INGRESANDO TOKEN
require "estado.php";

if(isset($_POST['token']) && strlen($_POST['token']) == 6 && isset($_POST['tipo'])){
    $token = trim($_POST['token']);
    $operacion = new EstadoEstac();
    $operacion->tipoOperacion($token,strtolower($_POST["tipo"]));

}else{
    echo "token no valido";
}

?>