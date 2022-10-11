<?php
require '../../../backend/Conexion.php';
    class ObtenerCocheras extends Conexion{

        public function ValidarLogin(){
            parent::Conexion();
        }

        public function patente($codigo){
                $host  ='bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
                $user ='ukfwnbqeu0ysoyct';
                $pass = 'TljBTzMktwbU4NwhYbj7';
                $db = 'bp6nfzavyucdmj07us1w';

                $connect = new mysqli("$host","$user","$pass","$db");

                $newEstacionamiento = $connect -> query("SELECT * FROM prov_estac WHERE cod_proveedor = '$codigo'");
                $array = array();
                while($row = mysqli_fetch_assoc($newEstacionamiento)){
                    $array[] = $row;
                }
                echo json_encode($array, JSON_NUMERIC_CHECK|JSON_PRETTY_PRINT| JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
        }
    }

$codigo = $_POST['codigo'];
$test = new ObtenerCocheras;
$test->patente($codigo);
?>