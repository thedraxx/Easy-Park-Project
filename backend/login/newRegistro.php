<?php

//RECIBE UN USUARIO, CONTRASEÑA, TELEFONO  Y CREA INSTANCIA - REGISTRO
require 'registro.php';

$nombre = $_POST['nombre'];
$mail =$_POST['mail'];
$localidad =$_POST['localidad'];
$pass =$_POST['pass'];
$tel = $_POST['tel'];
$tipoUsuario = $_POST['tipo'];



if($tipoUsuario  == "c"){
    $tipo = "cliente";
    $id = "cod_cliente";
}else{
    $tipo = "proveedor";
     $id = "cod_proveedor";
}


$ingresar = new Registro();
$ingresar-> IngresarUsuario($nombre,$mail,$localidad,$pass,$tel,$tipo,$id);
//EJEMPLO DE TIPO DE DATOS
//SQL(nombre,mail,localidad,telefono,tipodeusurio,id de cliente o proveedor)
//$ingresar-> IngresarUsuario("Juan","juan@gmail.com","Rosario","1234",123456,"cliente","cod_cliente");

?>