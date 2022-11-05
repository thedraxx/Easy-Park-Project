<?php
class ObtenerPatente
{
    // Cambiar El Estado
    public function CambiarEstado($estado, $token)
    {

        $tokenString = strval($token);
        $estadoString = strval($estado);

        $url = 'https://tonnish-swivel.000webhostapp.com/estado_estac/newOperacion.php';

        $data = array('token'=>$tokenString,'tipo'=> $estadoString); // PONER 'i'= ingreso  o 's' = salida
                    
        $fields_string = http_build_query($data);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string );
        $data = curl_exec($ch);
        curl_close($ch);     
    }
}

//  Recibe los datos del usuario por POST
$token =  $_POST['token'];
$estado = $_POST['ingreso'];

// Instancia la clase
$test = new ObtenerPatente;
// Llama al metodo CAMBIARESTADO
$CambiarEstado = $test->CambiarEstado($estado, $token);
