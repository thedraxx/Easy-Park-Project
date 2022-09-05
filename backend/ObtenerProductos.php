<?php
    require 'Conexion.php';

    class DevuelveProductos extends Conexion{

        public function DevuelveProductos(){

            parent::__construct();

        }

        
        public function get_productos(){

            $resultado = $this->conexion_db-> query('SELECT * FROM prov_estac');

            $productos = $resultado->fetch_all(MYSQLI_ASSOC);
         
            return $productos;

        }
    }

?>