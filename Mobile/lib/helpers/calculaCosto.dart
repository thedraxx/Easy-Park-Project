//*****CALCULA EL COSTO DE ESTACIOCIONAMIENTO POR MEDIO DE 2 FECHA *******//
String Costo(String ingreso, String salida, precio) {
  DateTime Ingreso = DateTime.parse(ingreso);
  DateTime Salida = DateTime.parse(salida);

  final difmin = Salida.difference(Ingreso).inMinutes;

  dynamic total = difmin * precio / 60;

  total = total.toStringAsFixed(2);

  return total;
}
