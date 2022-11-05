<?php

require "estado.php";

if(isset($_POST['token']) && strlen($_POST['token']) == 6){
    $operacion = new EstadoEstac();
    $operacion->Cancelar($_POST['token']);
}else{
    echo "sin datos";
}

?>