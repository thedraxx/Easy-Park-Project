<?php
    //CLASE ESTACIONAMIENTO
    require '../Conexion.php';

    class EstadoEstac extends Conexion{

        public function EstadoEstac(){
            parent::__construct();
        }


//********* FUNCION PARA ACTUALIZA ESTADO DE ESTACIONAMIENTO (CANTIDAD Y DISPONIBLIDAD ->"HABILITADO" ) DEVUELVE TRUE O FALSE */
        public function editCantidad($cod_estac,$cant_actual,$disponible){
            $op = FALSE;
//********** REALIZA CONSULTA CON ID DEL ESTACIONAMIENTO ***********//
            $consulta = $this-> conexion_db -> query("SELECT cod_estac FROM estado_estac WHERE cod_estac = '$cod_estac'");
            $datos = mysqli_fetch_assoc($consulta);

//************* SI EL ESTACIONAMIENTO NUNCA REALIZO ACTUALIZACION DE ESTADO, CREA REGISTRO DEL MISMO ****************//
           if($datos == NULL){
                $crear_estado = $this-> conexion_db -> query("INSERT INTO estado_estac (`cod_estac`, `cant_actual`, `disponible`)
                 VALUES ($cod_estac, $cant_actual, $disponible)");
//*************  VERIFICA SI LOS DATOS FUERON INGRESADOS A LA BASE DE DATOS **********/
                 if($crear_estado === True) $op = TRUE;

           }else{
//**************SI EL ESTACIONAMIENTO ESTA REGISTRADO EN LA TABLA DE ESTADO SOLAMENTE ACTUALIZA DATOS *************//
                $actualizar = $this->conexion_db-> query("UPDATE estado_estac SET cant_actual='$cant_actual' , disponible = '$disponible' WHERE cod_estac='$cod_estac'");
                if($actualizar === True) $op = TRUE;
            
           }
           echo intval($op);
           parent::cerrarDB();
        }
        
    }

?>