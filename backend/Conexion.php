<?php
    require ('ConectionDB.php');
    
    class Conexion {

        protected  $conexion_db;

        public function Conexion(){

            $this->conexion_db = new mysqli(DB_HOST,DB_USUARIO, DB_CONTRA, DB_NOMBRE);

            if ($this->conexion_db -> connect_errno) {
                echo "Fallo al conectar a servidor: " . $this->conexion_db->connect_error;
                return;
            }

            echo "conexion activa";
            $this-> conexion_db ->set_charset(DB_CHARSET);
            
            
        }
    }
?>