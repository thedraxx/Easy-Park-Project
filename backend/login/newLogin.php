<?php

//RECIBE UN USUARIO Y CONTRASEÑA Y CREA INSTANCIA - VALIDAR LOGIN
require 'validar.php';

$mail =$_POST['mail'];
$pass =$_POST['pass'];
$tipoUsuario = $_POST['tipo'];


if($tipoUsuario  == "c"){
    $tipo = "cliente";
}else{
    $tipo = "proveedor";
}

$validar = new Validarlogin();
$validar-> login($mail,$pass,$tipo);
//EJEMPLO DE TIPO DE DATOS
//$validar-> login("david@gmail.com","1234","cliente");

?>