<?php
require './estado.php';
class ObtenerPatente
{
    // Cambiar El Estado
    public function CambiarEstado($estado, $token)
    {
        $this->estado = $estado;
        $this->token = $token;

        // Instanciamos la clase EstadoEstac
        $operacion = new EstadoEstac();
        // Llamamos al método tipoOperacion enviandole el token y el estado a cambiar
        $operacion->tipoOperacion($this->token, $this->estado);
    }

    // Motrar Patente
    public function patente($token)
    {
        // Hacemos la conexion a la base de datos
        $host  = 'bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
        $user = 'ukfwnbqeu0ysoyct';
        $pass = 'TljBTzMktwbU4NwhYbj7';
        $db = 'bp6nfzavyucdmj07us1w';

        $connect = new mysqli("$host", "$user", "$pass", "$db");
        // Consultamos la patente del usuario
        $consulta = $connect->query("SELECT * FROM reserva WHERE token = '$token'");
        $ver = mysqli_num_rows($consulta);
        // Si es mayor a 0 quiere decir que encontro algo, por lo que procederemos a retornar esos datos
        if ($ver > 0) {
            $datos = mysqli_fetch_assoc($consulta);
            echo json_encode($datos, JSON_NUMERIC_CHECK | JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        }
        // SIno lo encontro entonces quiere decir que no encontro una patente asociada
        else {
            echo json_encode(false);
        }
    }
}

//  Recibe los datos del usuario por POST
$token =  $_POST['token'];
$estado = $_POST['estado'];

// Instancia la clase
$test = new ObtenerPatente;
// Llama al metodo CAMBIARESTADO
$CambiarEstado = $test->CambiarEstado($estado, $token);

// Si la respuesta es distinto a 0 entonces fue exitoso por lo que procedemos a buscar la patente asociada al token
if ($CambiarEstado !== "0" or $CambiarEstado !== 0) {
    $test->patente($token);
}
//  Sino retornamos un 0 dando a entender que algo salio mal
else {
    echo json_encode(0);
}
