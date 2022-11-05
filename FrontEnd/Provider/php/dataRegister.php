<?php
    require '../../../backend/Conexion.php';
    class ValidarLogin extends Conexion{
        public function ValidarLogin(){
            parent::Conexion();
        }

        // Este metodo es el que se encarga de hacer el login y validar los datos
        public function login($nombre,$password,$telefono, $email,$localidad){
                // Hacemos la conexion a la base de datos
                $host  ='bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
                $user ='ukfwnbqeu0ysoyct';
                $pass = 'TljBTzMktwbU4NwhYbj7';
                $db = 'bp6nfzavyucdmj07us1w';

                $connect = new mysqli("$host","$user","$pass","$db");
                // Insertamos los datos en la tabla proveedor
                $ingreso = $connect -> query("INSERT INTO proveedor (`cod_proveedor`, `nombre`, `password` , `telefono`, `mail`, `fecha_inscripcion`,`localidad`)
                VALUES (NULL, '$nombre','$password','$telefono','$email', CURDATE(),'$localidad')");
                // Si todo sale bien entonces...
                if($ingreso === TRUE){
                    echo json_encode("USUARIO REGISTRADO");
                // Si algo sale mal manda un mensaje de error
                } else {
                  echo json_encode("ERROR NO SE PUDO REGISTRAR");
                }
        }
    }

    // Recibimos los datos del formulario de registro por POST
    $nombre =  $_POST['nombre'];
    $password = $_POST['password'];
    $telefono =  $_POST['telefono'];
    $email = $_POST['email'];
    $localidad = $_POST['localidad'];
    // Instanciamos la clase ValidarLogin
    $test = new ValidarLogin;
    // Ejecutamos el método login
    $test->login($nombre,$password,$telefono, $email,$localidad)
?>