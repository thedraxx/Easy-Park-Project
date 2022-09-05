<?php
    require 'ObtenerProductos.php';
    $productos = new DevuelveProductos();
    $array_productos = $productos-> get_productos();
    echo json_encode($array_productos,JSON_NUMERIC_CHECK);
?>
