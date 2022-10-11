<?php
    //CLASE ESTACIONAMIENTO
    require './Conexion.php';
    require './crearFecha.php';

    class EstadoEstac extends Conexion{

        public function EstadoEstac(){
            parent::Conexion();
        }


        //************** ACTUALIZA TABLA ESTADO_ESTACIONAMIENTO *************/
        public function editCantidad($cod_estac,$cant_actual,$disponible){
            try{
                $actualizar = $this->conexion_db-> query("UPDATE estado_estac SET cant_actual='$cant_actual' , disponible = '$disponible' WHERE cod_estac='$cod_estac'");    
                $actualizar ===  TRUE ? '0': '';
            }catch(Exception $e){
                echo $e;
            }
        } 

/*********************** CONSULTA CANTIDAD DE DISPONIBLE *********************************/
        public function verCantidad($cod_estac){
            try{
                $disponible = $this-> conexion_db -> query("SELECT cant_actual FROM estado_estac WHERE cod_estac = $cod_estac");
                $ver = mysqli_num_rows($disponible);
                if($ver > 0){
                    $datos = mysqli_fetch_assoc($disponible);
                    $cantidad =  json_encode($datos['cant_actual'],JSON_NUMERIC_CHECK);
                    return $cantidad; 
                }
                }catch(Exception $e){
                    echo $e;
                }
        }


/***************************INCREMENTA O LIBERA LA CANTIDAD DISPONIBLE********************************/
        public function actualizar($token,bool $ingreso){
            try{
                $cant = 0;
                $consulta = $this-> conexion_db -> query("SELECT estac.cant_actual,estac.cod_estac FROM reserva JOIN estado_estac AS estac USING(cod_estac) WHERE token = '$token'");
                $ver = mysqli_num_rows($consulta);
                if($ver > 0){
                    $datos = mysqli_fetch_assoc($consulta);
                    $cod_estac =  json_encode($datos['cod_estac'],JSON_NUMERIC_CHECK);
                    $cantidad = json_encode($datos['cant_actual'],JSON_NUMERIC_CHECK);
                    $ingreso === TRUE ?$cant = 1 :$cant = -1;
                    $new_cant =  $cantidad - $cant;
                    $this->editCantidad($cod_estac,$new_cant,1);
                }else{
                    return '0';
                }
            }catch(Exception $e) {
                echo $e;
            }
        }


        //*******************CREA NUEVA RESERVA************************//
        public function CrearReserva($token,$cliente,$estac,$patente, $ingreso,$salida){
            $fecha = getDatetimeNow();
            try{
                $disponible = $this->verCantidad($estac);
                if($disponible > 0 ){
                    $nuevaReserva = mysqli_query($this -> conexion_db,"INSERT INTO reserva (`token`, `cod_cliente`, `cod_estac`, `patente`, `fecha`, `ingreso`,`salida`)
                    VALUES ('$token',$cliente,$estac,'$patente','$fecha','$ingreso','$salida')");
            /********************* AGREGA REGISTRO A TABLA ESTADO_RESERVA ****************************/
                    $estadoReserva = mysqli_query($this -> conexion_db,"INSERT INTO estado_reserva (`token`, `entrada`, `salida`, `cancelacion`, `fecha_ingr`, `fecha_sal`)
                    VALUES ('$token',0,0,0,NULL,NULL)");
                    $this->actualizar($token,TRUE);
                    echo !$nuevaReserva && !$estadoReserva ?'0' :$token;
                }else{
                    return "No dispoble";
                }
                parent::cerrarDB();
            }catch(Exception $e) {
                echo $e;
            }
        }

    //********* CONSULTA DATOS DE RESERVA INGRESANDO TOKEN - DEVUELVE (DATOS DE RESERVA O FALSE SI NO EXISTE)***********//
        public function MostrarReserva($token){
            if(!$this->verificaReserva($token)){
                $consulta = mysqli_query($this -> conexion_db,
                "SELECT cl.nombre,res.patente,res.ingreso,res.salida FROM reserva AS res JOIN cliente AS cl USING(cod_cliente) WHERE res.token = '$token'");
                    $datos = mysqli_fetch_assoc($consulta);
                    echo json_encode($datos, JSON_NUMERIC_CHECK|JSON_PRETTY_PRINT| JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
                parent::cerrarDB();
            }else echo "0";
        }

    /*****************MODIFICACION DE ESTADO DE RESERVA********************/
        public function tipoOperacion($token,$tipo){
            try{  
                // hace una consulta estado_reserva y te trae un array con $array = [$ingr,$salida,$cancelado];
                $op = $this->Reserva_Estado($token);
                $resul = FALSE;
                $fecha = getDatetimeNow();  
                // va a la tabla reserva y si encuentra la reserva devuelve true sino false
                if(!$this->verificaReserva($token) && $op[2] != 1){
                    // Si es de tipo salida 
                    if($tipo == "s" && $op[0] == 1 && $op[1]!= 1){
                        $resul = mysqli_query($this -> conexion_db,
                        "UPDATE `estado_reserva` SET`salida`= 1,`fecha_sal`='$fecha' WHERE `token`= '$token'");
                        // Aca actualiza estado_estac
                        $this->actualizar($token,FALSE);
                        // Si es de tipo ingreso
                    }elseif($tipo == "i" && $op[0]!= 1){
                        $resul = mysqli_query($this -> conexion_db,
                        "UPDATE `estado_reserva` SET`entrada`=1,`fecha_ingr`='$fecha' WHERE `token`= '$token'");
                    }
                    return !$resul ?'0':'1';
                } else{ 
                    return "0";
                    parent::cerrarDB();
                }
            }catch(Exception $e){
                echo $e;
            }
        }

 /********************VERIFICA SI EXISTE RESERVA*****************************/
        public function verificaReserva($token){
            try{
                $consulta = mysqli_query($this -> conexion_db,
                "SELECT * FROM reserva WHERE token = '$token'");
                $ver = mysqli_num_rows($consulta);
                return $ver > 0 ?FALSE : TRUE;
                parent::cerrarDB();
            }catch(Exception $e){
                echo $e;
            }  
        }

        /**************************CANCELAR RESERVA*****************************************/
        public function Cancelar($token){
            try{
                $op = $this->Reserva_Estado($token);
                if(!$this->verificaReserva($token) && $op[0] != 1){
                    $cancelar = mysqli_query($this -> conexion_db,
                    "UPDATE `estado_reserva` SET`cancelacion`=1 WHERE `token`= '$token'");
                    echo !$cancelar ?'0':'1';
                    $this->actualizar($token,FALSE);
                }else{
                    return "0";
                }
                parent::cerrarDB();
            }catch(Exception $e){
                echo $e;
            }
        }
/***********************DEVUELVE ARRAY CON ESTADO DE RESERVA (INGRESO,SALIDA,CANCELADO): BOOL ********************************* */
        public function Reserva_Estado($token){
            try{
                $array=[];
                $consulta = $this-> conexion_db -> query("SELECT * FROM `estado_reserva` WHERE token = '$token'");
                $datos = mysqli_fetch_assoc($consulta);
                $ver = mysqli_num_rows($consulta);
                if($ver > 0){
                    $ingr =  json_encode($datos['entrada'],JSON_NUMERIC_CHECK);
                    $salida = json_encode($datos['salida'],JSON_NUMERIC_CHECK);
                    $cancelado = json_encode($datos['cancelacion'],JSON_NUMERIC_CHECK);
                    $array = [$ingr,$salida,$cancelado];
                    return  $array; 
                }
            }catch(Exception $e){
                echo $e;
            }
        }

    }

?>