<?php
    require '../../../backend/Conexion.php';
    class ValidarLogin extends Conexion{

        public function ValidarLogin(){
            parent::Conexion();
        }
    
        public function login($nombre,$password,$telefono, $email,$localidad){
            if($nombre == '' or $password == '' or $telefono == '' or $email == '' or $localidad == '' ){
                echo json_encode( "validacion registro andando: <br>Usuario: '$nombre'. <br>pass: '.$password'");
            }else{
                $host  ='bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
                $user ='ukfwnbqeu0ysoyct';
                $pass = 'TljBTzMktwbU4NwhYbj7';
                $db = 'bp6nfzavyucdmj07us1w';

                $connect = new mysqli("$host","$user","$pass","$db");

                $ingreso = $connect -> query("INSERT INTO proveedor (`cod_proveedor`, `nombre`, `password` , `telefono`, `mail`, `fecha_inscripcion`,`localidad`)
                VALUES (NULL, '$nombre','$password','$telefono','$email', CURDATE(),'$localidad')");
                if($ingreso === TRUE){
                    echo "USUARIO REGISTRADO";
                } else {
                  echo "ERROR NO SE PUDO REGISTRAR";
                }
            }
        }
    }

    $nombre =  $_POST['nombre'];
    $password = $_POST['password'];
    $telefono =  $_POST['telefono'];
    $email = $_POST['email'];
    $localidad = $_POST['localidad'];

    $test = new ValidarLogin;
    $test->login($nombre,$password,$telefono, $email,$localidad)

?>