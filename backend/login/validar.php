<?php
//CLASE VALIDADOR DE USUARIO
require '../Conexion.php';

class ValidarLogin extends Conexion{

    public function ValidarLogin(){
        parent::Conexion();
    }

    public function login($mail,$pass,$tipoUsuario){

        try{
            $consulta = mysqli_query($this -> conexion_db, "SELECT * FROM $tipoUsuario WHERE mail = '$mail' AND password = '$pass'");
            $ver = mysqli_num_rows($consulta);
            if($ver > 0){
                $datos = mysqli_fetch_assoc($consulta);
                echo json_encode($datos, JSON_NUMERIC_CHECK|JSON_PRETTY_PRINT| JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
            }else{
                echo '0';
            }
         }catch(Exception $e){
             echo $e;
         }
         parent::cerrarDB();
    }
}

?>