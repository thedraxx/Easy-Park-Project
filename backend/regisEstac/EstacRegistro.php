<?php
//REGISTRO DE ESTACIONAMIENTO
require '../Conexion.php';
require '../formatoFecha/crearFecha.php';

class RegistroEstac extends Conexion{


    public function RegistroEstac(){
        parent::__construct();
    }

    public function IngresarProv($cod_prov,$direccion,$lat,$lng,$horario,$nombre,$cantidad,$imagen,$precio){
        $fecha = getDatetimeNow();

    
        try{
            $ingreso = mysqli_query($this-> conexion_db, "INSERT INTO `prov_estac` (`cod_estac`, `cod_proveedor`, `direccion`, `latitud`, `longitud`, `horario`, `nombre`, `cantidad`, `imagen`,`fecha_inscripcion`,`precio`) 
            VALUES (NULL, $cod_prov,'$direccion',$lat,$lng,'$horario','$nombre',$cantidad,'$imagen','$fecha',$precio)");

               if($ingreso === TRUE){
                   echo "ESTACIONAMIENTO REGISTRADO";
                   
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

