<?php

//RECIBE UN USUARIO Y CONTRASEÑA Y CREA INSTANCIA - VALIDAR LOGIN
require 'validar.php';

if(isset($_POST['mail']) && $_POST['mail']!= " " && isset($_POST['pass']) && $_POST['pass'] != " " && isset($_POST['tipo']) && $_POST['tipo'] != " "){
    if($_POST['tipo'] == "c"){
        $tipo = "cliente";
    }else{
        $tipo = "proveedor";
    }
    $validar = new Validarlogin();
    $validar-> login($_POST['mail'],$_POST['pass'],$tipo);
    //EJEMPLO = $validar-> login("david@gmail.com","1234","cliente");
}else{
    echo "Error en datos cargados";
}

?>