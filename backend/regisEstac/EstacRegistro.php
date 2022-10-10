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
               if ($ingreso === TRUE) 
                $op = TRUE;
                $this->CreaEstado($cod_prov,$direccion,$cantidad);
            

            }catch(Exception $e){
                echo $op;
            }
            echo $op;
            parent::cerrarDB();
        }

        /**************************** CREA ESTADO DE ESTACIONAMIENTO ******************************/
        public function CreaEstado($cod_prov,$direccion,$cantidad){
            try{
                $consulta = $this-> conexion_db -> query("SELECT cod_estac FROM prov_estac WHERE cod_proveedor = $cod_prov AND direccion = '$direccion'");
                $ver = mysqli_num_rows($consulta);
                if($ver > 0){
                    $datos = mysqli_fetch_assoc($consulta);
                    $cod_estac =  json_encode($datos['cod_estac'],JSON_NUMERIC_CHECK);
                    $this-> conexion_db -> query("INSERT INTO estado_estac (`cod_estac`, `cant_actual`, `disponible`) VALUES ($cod_estac, $cantidad, 1)");
                }else{
                    echo '0';
                }
            }catch(Exception $e){
                    echo $e;
            }
        }
}
?>

