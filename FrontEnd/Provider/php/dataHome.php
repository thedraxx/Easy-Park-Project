<?php
    require '../../../backend/Conexion.php';
    class ObtenerPatente extends Conexion{

        public function ValidarLogin(){
            parent::Conexion();
        }
        
        public function patente($token, $estado){

            if($token == '' or $estado == ''){
                echo json_encode( "validacion registro andando: <br>Usuario: '$token'. <br>pass: '.$estado'");
            }else{
                $host  ='bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
                $user ='ukfwnbqeu0ysoyct';
                $pass = 'TljBTzMktwbU4NwhYbj7';
                $db = 'bp6nfzavyucdmj07us1w';

                $connect = new mysqli("$host","$user","$pass","$db");

                $consulta = $connect -> query("SELECT * FROM reserva WHERE token = '$token'");
                $ver = mysqli_num_rows($consulta);
                if($ver > 0){
                    $datos = mysqli_fetch_assoc($consulta);
                    echo json_encode($datos, JSON_NUMERIC_CHECK|JSON_PRETTY_PRINT| JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
                }else{
                    echo json_encode(false);
                }
            }
        }
    }

    $token =  $_POST['token'];
    $estado = $_POST['estado'];


    $test = new ObtenerPatente;
    $test->patente( $token,$estado);
?>