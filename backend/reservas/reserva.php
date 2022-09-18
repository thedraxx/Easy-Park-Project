<?php
//CLASE CREAR RESERVA
require '../Conexion.php';
require '../formatoFecha/crearFecha.php';


class Reserva extends Conexion{

         public function Reserva()
         {
             parent::__construct();
         }
//CREA NUEVA RESERVA
         public function CrearReserva($token,$cliente,$estac,$patente, $ingreso,$salida){
             $fecha = getDatetimeNow();
             $nuevaReserva = mysqli_query($this -> conexion_db,"INSERT INTO reserva (`token`, `cod_cliente`, `cod_estac`, `patente`, `fecha`, `ingreso`,`salida`)
             VALUES ('$token',$cliente,$estac,'$patente','$fecha','$ingreso','$salida')");
 
             if($nuevaReserva === TRUE){
                echo $token;
             } else {
             echo "0";
             }
         }

 //********* CONSULTA DATOS DE RESERVA INGRESANDO TOKEN - DEVUELVE (DATOS DE RESERVA O FALSE SI NO EXISTE)***********//
         public function MostrarReserva($token){
            $op =  FALSE;
             $consulta = mysqli_query($this -> conexion_db,
             "SELECT cl.nombre,res.patente,res.ingreso,res.salida FROM reserva AS res JOIN cliente AS cl USING(cod_cliente) WHERE res.token = '$token'");
             $ver = mysqli_num_rows($consulta);
             if($ver > 0){
                $datos = mysqli_fetch_assoc($consulta);
                echo json_encode($datos, JSON_NUMERIC_CHECK|JSON_PRETTY_PRINT| JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
            }else{
                echo intval($op);
            }
       
         }
 }

?>