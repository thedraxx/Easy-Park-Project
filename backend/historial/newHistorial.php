<?php

require 'histReservas.php';

/****************************CREA INSTANCIA PARA VER HISTORIAL**************************************/
/************EJEMPLO (TIPO USAURIO = CLIENTE O ESTACIONAMIENTO ('C' o 'E') Y SU CODIGO DE USUARIO (1) )*********/
if(isset($_POST['usuario']) && $_POST['usuario'] != " " && isset($_POST['cod_usuario']) && $_POST['cod_usuario']!= " "){
    $usuario = strtolower($_POST['usuario']);
    if( $usuario == "c" || $usuario == "e" ){
        if($usuario == "c")$tUsuario = "cod_cliente";
        else $tUsuario = "cod_estac";
        $consulta = new Historial();
        $consulta->allReservas($tUsuario,$_POST['cod_usuario']);
    }else  echo "Error! datos incorrectos";
}else{
    echo "Error! sin datos";
}
?>