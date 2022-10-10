import 'package:easy_park/helpers/distancias.dart';

//********ORDENA UN LISTA MAP POR DISTANCIA MAS PROXIMA DE UNA UBICACION ESPECIFICA**********//
OrdenaLista(snapshot, mylat, mylng) {
  List<Map<String, dynamic>> NuevaLista = [];

  for (int i = 0; i < snapshot.data.length; i++) {
    var nuevodato = {
      "id": snapshot.data[i].cod_estac,
      "direccion": snapshot.data[i].direccion,
      "nombre": snapshot.data[i].nombre,
      "horario": snapshot.data[i].horario,
      "lat": snapshot.data[i].latitud,
      "long": snapshot.data[i].longitud,
      "distancia": calculateDistance(
          mylat, mylng, snapshot.data[i].latitud, snapshot.data[i].longitud),
      "precio": snapshot.data[i].precio,
      "cantidad": snapshot.data[i].cantidad,
      "imagen": snapshot.data[i].imagen
    };
    NuevaLista.add(nuevodato);
  }

  List<Map<String, dynamic>> Orderlist = List.of(NuevaLista);
  Orderlist.sort((a, b) {
    return (a['distancia']).compareTo(b['distancia']);
  });
  return Orderlist;
}
