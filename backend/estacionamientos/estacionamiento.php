<?php
    //CLASE ESTACIONAMIENTO
    require '../Conexion.php';

    class Estacionamiento extends Conexion{

        public function Estacionamiento(){
            parent::Conexion();
        }

        public function get_estacionamientos(){

            $resultado = $this->conexion_db-> query('SELECT * FROM prov_estac AS estc JOIN estado_estac AS estado USING(cod_estac)');
            $estacionamientos = $resultado->fetch_all(MYSQLI_ASSOC);
            return $estacionamientos;
            parent::cerrarDB();
        }
        
    }

?>