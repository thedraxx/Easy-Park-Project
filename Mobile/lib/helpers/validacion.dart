//VALIDA NOMBRE INGRESADO
ValidaNombre(String data) {
  if (data.isEmpty || data.length < 3) {
    return "error";
  }
}

//VALIDA USUARIO
ValidaUsuario(String data) {
  if (data.isEmpty || !data.contains('@') || data.length < 6) {
    return "error";
  }

  return null;
}

//VALIDAR PASSWORD
ValidaPass(dynamic data) {
  if (data!.isEmpty || data.length < 4) {
    return "error";
  }
  return null;
}

//VERIFICA SE COINSIDE DATOS
ValidaIgualPass(dynamic data, dynamic pass) {
  if (data!.isEmpty) {
    return "error";
  } else if (data != pass) {
    return "no coinside contraseña";
  }
  return null;
}

//VALIDA TELEFONO
ValidaTel(String data) {
  if (data.isEmpty || data.length < 8) {
    return 'error';
  }
  return null;
}

//MOSTRAR O OCULTAR DATO
OcultarWidget(Function update, bool data) {
  bool result;
  if (data == true) {
    result = false;
  } else {
    result = true;
  }
  update();
  return result;
}

//VALIDAR PATENTE
ValidaPatente(dynamic data) {
  if (data!.isEmpty || data.length < 6) {
    return "error";
  }
  return null;
}
