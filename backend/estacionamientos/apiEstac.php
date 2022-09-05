<?php
//MUESTRA LOS ESTACIONAMIENTOS REGISTRADOS
    require 'estacionamiento.php';
    $estacionamientos = new Estacionamiento();
    $array_estacionamientos = $estacionamientos-> get_estacionamientos();
    echo json_encode($array_estacionamientos,JSON_NUMERIC_CHECK); 
?>