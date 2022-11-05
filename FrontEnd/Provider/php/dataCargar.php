<?php
class CargarVehiculo{

    public function RegistrarEstacionamiento(
    $nombre,
    $plazas,
    $horario,
    $precio,
    $ciudad,
    $provincia,
    $calle,
    $numero,
    $codigo
    ){
        $ciudadString = strval($ciudad);
        $provinciaString = strval($provincia);
        $calleString = strval($calle);
        $nombreString = strval($nombre);
        $horarioString = strval($horario);
        $numeroInt = intval($numero);
        $plazasInt = intval($plazas);
        $precioInt = intval($precio);
        $codigoInt = intval($codigo);
        

        $url = 'https://tonnish-swivel.000webhostapp.com/regisEstac/newEstac.php';

        $data = array( 'calle'=> $calleString, 
                    'numero'=> $numeroInt,
                    'ciudad' => $ciudadString,
                    'provincia' => $provinciaString, 
                    'cod_prov' => $codigoInt,
                    'nombre' => $nombreString,
                    'horario' => $horarioString,
                    'cantidad' => $plazasInt,
                    'imagen' =>'https://www.clarin.com/img/2021/03/09/xiW_3rJCs_1200x630__1.jpg',
                    'precio' => $precioInt
                 );

                 $fields_string = http_build_query($data);
                 $ch = curl_init();
                 curl_setopt($ch, CURLOPT_URL, $url);
                 curl_setopt($ch, CURLOPT_POST, 1);
                 curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string );
                 $data = curl_exec($ch);
                 curl_close($ch);

        
    }

}


// Recibimos los datos en POST
$nombre = $_POST['nombre'];
$plazas = $_POST['cantidad'];
$horario = $_POST['horario'];
$precio = $_POST['precio'];
$ciudad = $_POST['ciudad'];
$provincia = $_POST['provincia'];
$calle = $_POST['calle'];
$numero = $_POST['numero'];
$codigo = $_POST['cod_prov'];

// Instanciamos la clase CargarVehiculo
$test = new CargarVehiculo;
// Ejecutamos el metodo patente
$registrarestacionamiento = $test->RegistrarEstacionamiento(
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
