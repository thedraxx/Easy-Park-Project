<?php
//GENERA TOKEN
function generar_token()
{
    //bin2hex — Convierte datos binarios en su representación hexadecimal
    //openssl_random_pseudo_bytes — Genera una cadena de bytes pseudo-aleatoria
    $lenth = 6;
    return strtoupper(bin2hex(openssl_random_pseudo_bytes(($lenth - ($lenth % 2)) / 2))) ;
}

?>