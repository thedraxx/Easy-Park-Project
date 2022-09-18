<?php

require "estado.php";

//**** VERIFICA SI SE INGRESAN DATOS (ID DEL ESTACIONAMIENTO , CANTIDAD ACTUAL DEL MISMO , Y DISPONIBLIDAD = 1 O 0 ) ******/
if(isset($_POST['cod_estac']) && $_POST['cod_estac'] != " " && isset($_POST['cant_actual']) && $_POST['cant_actual'] != " " && isset($_POST['disponible']) && $_POST['disponible'] == 1 OR $_POST['disponible'] ==  0 ){
    //*********EJEMPLO (1,50,1) *******//
$newEdit = new EstadoEstac();
$newEdit->editCantidad($_POST['cod_estac'],$_POST['cant_actual'],$_POST['disponible']);
}else{
    echo "ERROR EN DATOS";
}

?>