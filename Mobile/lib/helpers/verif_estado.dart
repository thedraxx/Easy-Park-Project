VerificaEstado(int entrada, int salida, int cancelacion) {
  String estado = "En curso";
  if (cancelacion == 1) {
    estado = "Cancelada";
  } else if (entrada == 1 && salida == 1) {
    estado = "Finalizado";
  } else if (entrada == 1) {
    estado = "Ingresado";
  }

  return estado;
}

estadoReser(int entrada, int cancelacion) {
  bool reserva = true;
  if (entrada == 0 && cancelacion == 0) {
    reserva = true;
  } else {
    reserva = false;
  }
  return reserva;
}
