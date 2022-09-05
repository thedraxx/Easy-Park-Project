<?php
//CLASE VALIDADOR DE USUARIO
require '../Conexion.php';

class ValidarLogin extends Conexion{

    public function ValidarLogin(){
        parent::__construct();
    }

    public function login($usuario,$pass,$tipoUsuario){
   
        if($usuario == '' or $pass == ''){
            echo 'ERROR';
        }else{
            $consulta = mysqli_query($this -> conexion_db, "SELECT * FROM $tipoUsuario WHERE mail = '$usuario' AND password = '$pass'");
            $ver = mysqli_num_rows($consulta);
            if($ver > 0){
                $datos = mysqli_fetch_assoc($consulta);
                echo json_encode($datos, JSON_NUMERIC_CHECK|JSON_PRETTY_PRINT| JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
            }else{
                echo '0';
            }
           
        }
          
    }
}
?>