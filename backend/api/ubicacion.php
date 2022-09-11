<?php

//OBTIENE LATITUD Y LONGITUD DE UNA DIRECCION DETERMINADA
function ObtenerLatLng(String $calle,String $numero, String $ciudad, String $provincia){
    $latLng = []; 

    if($calle != " " && $numero != " " && $ciudad != " " && $provincia != " " ){

        $ubicacion = 'q='.preg_replace('/\s+/', '',strtolower($numero)).'+'.preg_replace('/\s+/', '',strtolower($calle)).'+St.+'.preg_replace('/\s+/', '',strtolower($ciudad)).'%2C+'.preg_replace('/\s+/', '',strtolower($provincia));
   
        $url = 'https://geocode.search.hereapi.com/v1/geocode?'.$ubicacion.'&apiKey=9LNlv8xOMrSI4Obk7juyIRP4iP7JyF_SynDkWC1J8a0';

        $response =  json_decode(file_get_contents($url),false);
    
            $lat=$response->items[0]->access[0]->lat;
            $lng=$response->items[0]->access[0]->lng;
            $latLng =[$lat,$lng]; 
          //echo "LATITUD: ". $lat."         LONGITUD:  ".$lng;
          //echo "tiene datos";
    }else{
        echo "ERROR EN DATOS";
    }
    return $latLng;
}



?>