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
            $ingreso = mysqli_query($this -> conexion_db, "INSERT INTO $tipoUsuario (`$id`, `nombre`, `mail`, `password`, `telefono`, `fecha_inscripcion`,`localidad`)
            VALUES (NULL, '$nombre','$mail','$pass',$tel, '$fecha','$localidad')");
               if($ingreso === TRUE){
                echo "USUARIO REGISTRADO";
              
            } else {
              echo "ERROR NO SE PUDO REGISTRAR";
            }

        }catch(Exception $e){
            echo $e;
        }
        parent::cerrarDB();
    }
}
?>