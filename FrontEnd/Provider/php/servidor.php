<?php
    require '../../../backend/Conexion.php';
    class ValidarLogin extends Conexion{

        public function ValidarLogin(){
            parent::Conexion();
        }
        public function login($usuario, $password){
            if($usuario == '' or $password == '' ){
                echo json_encode( "validacion andando: <br>Usuario: '$usuario'. <br>pass: '.$password'");
            }else{
                $host  ='bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
                $user ='ukfwnbqeu0ysoyct';
                $pass = 'TljBTzMktwbU4NwhYbj7';
                $db = 'bp6nfzavyucdmj07us1w';

                $connect = new mysqli("$host","$user","$pass","$db");

                $consulta = $connect -> query( "SELECT * FROM proveedor WHERE nombre = '$usuario' AND password = '$password'");
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
    
    $usuario =  $_POST['usuario'];
    $password = $_POST['password'];
    $test = new ValidarLogin;
    $test->login($usuario,$password)
?>