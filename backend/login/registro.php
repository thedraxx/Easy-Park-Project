<?php
//CLASE VALIDADOR DE USUARIO
require '../Conexion.php';
require '../formatoFecha/crearFecha.php';

class Registro extends  Conexion{

    public function Registro(){
        parent::__construct();
    }

    public function IngresarUsuario($nombre,$mail,$localidad,$pass,$tel,$tipoUsuario,$id){
        $fecha = getDatetimeNow();
        try{

            $verUsuario = mysqli_query($this -> conexion_db, "SELECT * FROM $tipoUsuario WHERE mail = '$mail'");
            $ver = mysqli_num_rows($verUsuario);
            
            if($ver > 0){
                echo "0";
            }else{
                $ingreso = mysqli_query($this -> conexion_db, "INSERT INTO $tipoUsuario (`$id`, `nombre`, `mail`, `password`, `telefono`, `fecha_inscripcion`,`localidad`)
                VALUES (NULL, '$nombre','$mail','$pass',$tel, '$fecha','$localidad')");
                if($ingreso === TRUE){
                    echo "1";
                    
                }else{
                    echo "ERROR";
                }
            }

        }catch(Exception $e){
            echo $e;
        }
        parent::cerrarDB();
    }
}
?>