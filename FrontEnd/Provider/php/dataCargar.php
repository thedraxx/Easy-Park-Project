<?php
require '../../../backend/Conexion.php';
require '../../../backend/api/ubicacion.php';
    class CargarVehiculo extends Conexion{

        public function ValidarLogin(){
            parent::Conexion();
        }

        public function patente(    
            $nombre,
            $plazas,
            $horario,
            $precio,
            $ciudad,
            $provincia,
            $calle,
            $numero,
            $codigo,
        ){

            if($nombre == '' or $plazas == '' or $horario == '' or $precio == '' or $codigo == ''){
                echo json_encode( "validacion registro andando");
            }else{
                $host  ='bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
                $user ='ukfwnbqeu0ysoyct';
                $pass = 'TljBTzMktwbU4NwhYbj7';
                $db = 'bp6nfzavyucdmj07us1w';

                $connect = new mysqli("$host","$user","$pass","$db");

                $lat = ObtenerLatLng( $calle, $numero, $ciudad, $provincia);
                   
                $latitud = $lat[0];
                $longitud = $lat[1];

                $direccion = $calle .' '. $numero;

                $newEstacionamiento = $connect -> query("INSERT INTO prov_estac(`cod_estac`, `cod_proveedor`, `direccion`, `latitud`, `longitud`, `horario`, `nombre`, `cantidad`, `imagen`,`fecha_inscripcion`,`precio`)
                VALUES (NULL, $codigo,'$direccion',$latitud,$longitud,'$horario','$nombre',$plazas,'https://atrapatuled.es/modules/amazzingblog/views/img/uploads/posts/8/xl/3-5fa074a4d235c.jpg',CURDATE(),$precio)");
                if($newEstacionamiento === TRUE){
                    echo json_encode(true);
                } else {
                    echo json_encode(false);
                }
            }
        }
    }



$nombre = $_POST['nombre'];
$plazas = $_POST['plazas'];
$horario = $_POST['horario'];
$precio = $_POST['precio'];
$ciudad = $_POST['ciudad'];
$provincia = $_POST['provincia'];
$calle = $_POST['calle'];
$numero = $_POST['numero'];
$codigo = $_POST['codigo'];



$test = new CargarVehiculo;
$test->patente(
    $nombre,
    $plazas,
    $horario,
    $precio,
    $ciudad,
    $provincia,
    $calle,
    $numero,
    $codigo,
);


?>
