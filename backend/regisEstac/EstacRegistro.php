<?php
//REGISTRO DE ESTACIONAMIENTO
require '../Conexion.php';
require '../formatoFecha/crearFecha.php';

class RegistroEstac extends Conexion{


    public function RegistroEstac(){
        parent::__construct();
    }
//********** FUNCION - INGRESO DE ESTACIONAMIENTOS  DEVUELVE (TRUE O FALSE) *********/
    public function IngresarProv($cod_prov,$direccion,$lat,$lng,$horario,$nombre,$cantidad,$imagen,$precio){
        $op = FALSE;
        $fecha = getDatetimeNow();

        try{
            $ingreso = mysqli_query($this-> conexion_db, "INSERT INTO `prov_estac` (`cod_estac`, `cod_proveedor`, `direccion`, `latitud`, `longitud`, `horario`, `nombre`, `cantidad`, `imagen`,`fecha_inscripcion`,`precio`) 
            VALUES (NULL, $cod_prov,'$direccion',$lat,$lng,'$horario','$nombre',$cantidad,'$imagen','$fecha',$precio)");
               if ($ingreso === TRUE) $op = TRUE;
            }catch(Exception $e){
                echo $op;
            }
            echo $op;
            parent::cerrarDB();
        }
}
?>

