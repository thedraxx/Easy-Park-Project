<?php
require '../api/ubicacion.php';
require 'EstacRegistro.php';

//CREA NUEVO REGISTRO DE ESTACIONAMIENTO
if(isset($_POST['cod_prov'])/*&& $_POST['cod_prov'] != " " && isset($_POST['nombre']) && $_POST['nombre'] != " " && isset($_POST['cantidad'])
    && $_POST['cantidad'] != " " && isset($_POST['calle']) && $_POST['calle'] != " " && isset($_POST['numero']) && $_POST['numero'] != " " && 
    isset($_POST['ciudad']) && $_POST['ciudad']&& isset($_POST['provincia']) && $_POST['provincia'] != " " 
    && isset($_POST['horario']) && $_POST['horario'] != " " && isset($_POST['imagen']) && $_POST['imagen'] != " " 
    && isset($_POST['precio']) && $_POST['precio'] != " "*/){

    //ObtenerLatLng("Mendoza","423","Rosario","Santa fe");
    $newLatLng=ObtenerLatLng($_POST['calle'],$_POST['numero'],$_POST['ciudad'],$_POST['provincia']);
 
    $direccion = $_POST['calle']." ".$_POST['numero']." ".$_POST['ciudad']." ".$_POST['provincia']; 

        $nuevoProv = new RegistroEstac();
        //EJEMPLO = (NULL, 23, 'San juan 100', -32.9644981, -60.6499201, '8 hs a 20 hs', 'LA NUEVA', 100, 'https://atrapatuled.es/modules/amazzingblog/views/img/uploads/posts/8/xl/3-5fa074a4d235c.jpg', '150')
        $nuevoProv -> IngresarProv($_POST['cod_prov'],$direccion,$newLatLng[0],$newLatLng[1],$_POST['horario'],$_POST['nombre'],$_POST['cantidad'],$_POST['imagen'],$_POST['precio']);

}else{
    echo "Error en datos";
}

?>