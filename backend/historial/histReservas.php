<?php

require '../Conexion.php';

class Historial extends Conexion{

    public function Historial(){
        parent::__construct();
    }
/************************* HISTORIAL DE RESERVAS *******************************/
    public function allReservas(string $tUsuario, int $cod_usuario){

        $consulta = $this->conexion_db->query("SELECT * FROM reserva AS res JOIN estado_reserva AS estR USING(token) WHERE res.$tUsuario = $cod_usuario ORDER BY res.fecha DESC");
        $ver = mysqli_num_rows($consulta);
        if($ver>0){
            $reservas = $consulta->fetch_all(MYSQLI_ASSOC);
            echo json_encode($reservas, JSON_NUMERIC_CHECK|JSON_PRETTY_PRINT| JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
        }else echo "0";
        parent::cerrarDB();
    }
}

?>