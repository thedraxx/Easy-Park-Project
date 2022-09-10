<?php

//RECIBE UN USUARIO, CONTRASEÑA, TELEFONO  Y CREA INSTANCIA - REGISTRO
require 'registro.php';

if(isset($_POST['nombre']) && $_POST['nombre'] != " " && 
    isset($_POST['mail']) && $_POST['mail'] != " " && isset($_POST['pass']) 
    && $_POST['pass'] != " " && isset($_POST['tipo'])&& $_POST['tipo'] != " " )
    {
        if($_POST['tipo']  == "c"){
            $tipo = "cliente";
            $id = "cod_cliente";
        }else{
            $tipo = "proveedor";
            $id = "cod_proveedor";
        }
    $ingresar = new Registro();
    $ingresar-> IngresarUsuario($_POST['nombre'],$_POST['mail'],$_POST['localidad'],$_POST['pass'],$_POST['tel'],$tipo,$id);
    //EJEMPLO = IngresarUsuario("Juan","juan@gmail.com","Rosario","1234",123456,"cliente","cod_cliente");
}else{
    echo "Error en datos cargados";
}
?>