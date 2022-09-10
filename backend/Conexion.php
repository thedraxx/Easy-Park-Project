<?php
    require ('ConectionDB.php');
    
    class Conexion {

        protected  $conexion_db;

        public function Conexion(){
            try{
              $this->conexion_db = new mysqli(DB_HOST,DB_USUARIO, DB_CONTRA, DB_NOMBRE);
        
            }catch(Exception $e){
                echo "ERROR" .$e;
            }
        }
        public function cerrarDB(){
            mysqli_close($this->conexion_db);
         
        }
        
    }

?>