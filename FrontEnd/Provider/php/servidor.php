<?php

    $usuario = $_POST['usuario'];
    $password = $_POST['password'];

    echo json_encode("correcto: <br>Usuario: '$usuario'. <br>pass: '.$password'")

?>