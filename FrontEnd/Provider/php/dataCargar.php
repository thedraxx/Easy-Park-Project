<?php
require './Conexion.php';
require './ubicacion.php';
class CargarVehiculo extends Conexion{

    public function ValidarLogin(){
        parent::Conexion();
    }

    // Funcion para cargar los datos de la tabla vehiculo
    public function patente(    
        $nombre,
        $plazas,
        $horario,
        $precio,
        $ciudad,
        $provincia,
        $calle,
        $numero,
        $codigo
    )
    {
        // Coneccion a la base de datos
            $host  ='bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
            $user ='ukfwnbqeu0ysoyct';
            $pass = 'TljBTzMktwbU4NwhYbj7';
            $db = 'bp6nfzavyucdmj07us1w';

            $connect = new mysqli("$host","$user","$pass","$db");

            // Con esta funcion obtenemos la longitud y latitud de la ubicacion
            $lat = ObtenerLatLng( $calle, $numero, $ciudad, $provincia);
            $latitud = $lat[0];
            $longitud = $lat[1];

            // Unimos calle con numero para tener la direccion
            $direccion = $calle .' '. $numero;

            // Insertamos los datos en la tabla vehiculo
            $newEstacionamiento = $connect -> query("INSERT INTO prov_estac(`cod_estac`, `cod_proveedor`, `direccion`, `latitud`, `longitud`, `horario`, `nombre`, `cantidad`, `imagen`,`fecha_inscripcion`,`precio`)
            VALUES (NULL, $codigo,'$direccion',$latitud,$longitud,'$horario','$nombre',$plazas,'https://atrapatuled.es/modules/amazzingblog/views/img/uploads/posts/8/xl/3-5fa074a4d235c.jpg',CURDATE(),$precio)");
            //    Si todo sale bien devuelve true sino False
           if($newEstacionamiento === TRUE){
                echo json_encode(true);
            } else {
                echo json_encode(false);
            }
    }
}


// Recibimos los datos en POST
$nombre = $_POST['nombre'];
$plazas = $_POST['plazas'];
$horario = $_POST['horario'];
$precio = $_POST['precio'];
$ciudad = $_POST['ciudad'];
$provincia = $_POST['provincia'];
$calle = $_POST['calle'];
$numero = $_POST['numero'];
$codigo = $_POST['codigo'];

// Instanciamos la clase CargarVehiculo
$test = new CargarVehiculo;
// Ejecutamos el metodo patente
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
