<?php
    require '../../../backend/Conexion.php';

    class ObtenerPatente extends Conexion{



        public function ValidarLogin(){
            parent::Conexion();
        }

         // Consultamos y traemos los datos del estacionamiento
        public function ObtenerCochera($cocheras){
            $numCochera = intval($cocheras);
            $host  ='bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
            $user ='ukfwnbqeu0ysoyct';
            $pass = 'TljBTzMktwbU4NwhYbj7';
            $db = 'bp6nfzavyucdmj07us1w';
            $connect = new mysqli("$host","$user","$pass","$db");
            $sql = $connect -> query("SELECT * FROM `estado_estac` WHERE `cod_estac` = $numCochera");
            $row = $sql -> fetch_assoc();
            $codigo = $row['cod_estac'];
            $cantidad = $row['cant_actual'];
            $disponible = $row['disponible'];
            return array($codigo,$cantidad,$disponible);
        }

        // Cambiar El Estado
        public function CambiarEstado($arrayCochera, $estado){
            $codigo = $arrayCochera[0];
            $cantidad = intval($arrayCochera[1]);
            $disponible = intval($arrayCochera[2]);
            $this->estado = $estado;

            // Si el estado es Ocupado, sumamos 1 a la cantidad de cocheras ocupadas
            if ($this->estado  =='Ocupado') {
                $cantidad = $cantidad + 1;
                $disponible = $disponible - 1;  
            }
            //  Si el estado es Disponible, restamos 1 a la cantidad de cocheras ocupadas
            if ($this->estado  == 'Disponible') {
                $cantidad = $cantidad - 1;
                $disponible = $disponible + 1;
            }
            // Si el estado es Mantenimiento, restamos 1 a la cantidad de cocheras ocupadas
            if ($this->estado  == 'Reservado') {
                $cantidad = $cantidad + 1;
                $disponible = $disponible - 1;        
                
            }

            $op = FALSE;
            $host  ='bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
            $user ='ukfwnbqeu0ysoyct';
            $pass = 'TljBTzMktwbU4NwhYbj7';
            $db = 'bp6nfzavyucdmj07us1w';
            $connect = new mysqli("$host","$user","$pass","$db");
            $consulta = $connect -> query("SELECT cod_estac FROM estado_estac WHERE cod_estac = '$codigo'");
            $datos = mysqli_fetch_assoc($consulta);
    
            //!SI EL ESTACIONAMIENTO NUNCA REALIZO ACTUALIZACION DE ESTADO, CREA REGISTRO DEL MISMO ****************//
           if($datos == NULL){
                $crear_estado = $connect -> query("INSERT INTO estado_estac (`cod_estac`, `cant_actual`, `disponible`)
                 VALUES ($codigo, $cantidad, $disponible)");
                 //! VERIFICA SI LOS DATOS FUERON INGRESADOS A LA BASE DE DATOS **********/
                 if($crear_estado === True) {
                    return $op = TRUE;
                } 
                //! SI EL ESTACIONAMIENTO ESTA REGISTRADO EN LA TABLA DE ESTADO SOLAMENTE ACTUALIZA DATOS *************//
           }else{
                $actualizar = $connect -> query("UPDATE estado_estac SET cant_actual='$cantidad' , disponible = '$disponible' WHERE cod_estac='$codigo'");
                if($actualizar === True){
                   return $op = TRUE;
                } 
           }
        }
    
        public function patente($token, $estado){
            if($token == '' or $estado == ''){
                echo json_encode( "validacion registro andando: <br>Usuario: '$token'. <br>pass: '.$estado'");
            }else{
                $host  ='bp6nfzavyucdmj07us1w-mysql.services.clever-cloud.com';
                $user ='ukfwnbqeu0ysoyct';
                $pass = 'TljBTzMktwbU4NwhYbj7';
                $db = 'bp6nfzavyucdmj07us1w';

                $connect = new mysqli("$host","$user","$pass","$db");
                $consulta = $connect -> query("SELECT * FROM reserva WHERE token = '$token'");
                $ver = mysqli_num_rows($consulta);
                if($ver > 0){
                    $datos = mysqli_fetch_assoc($consulta);
                    echo json_encode($datos, JSON_NUMERIC_CHECK|JSON_PRETTY_PRINT| JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
                }else{
                    echo json_encode(false);
                }
            }
        }
    }

    $token =  $_POST['token'];
    $estado = $_POST['estado'];
    $cocheras = $_POST['cocheras'];

    $test = new ObtenerPatente;
    $arrayCochera =  $test->ObtenerCochera($cocheras);
    $CambiarEstado = $test->CambiarEstado($arrayCochera, $estado);

    if ($CambiarEstado) {
        $test->patente($token, $estado);
    }
   
