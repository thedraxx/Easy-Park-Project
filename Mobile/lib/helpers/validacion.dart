//VALIDA NOMBRE INGRESADO
ValidaNombre(String data) {
  if (data.isEmpty || data.length < 3) {
    return "error";
  }
}

//VALIDA USUARIO
ValidaUsuario(String data) {
  if (data.isEmpty ||
      !data.contains('@') ||
      !data.contains('.') ||
      data.length < 6) {
    return "mail incorrecto";
  }

  return null;
}

//VALIDAR PASSWORD
dynamic ValidaPass(String value) {
  String pattern = r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{7,}$';
  RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return 'ingrese contraseña!';
  } else {
    if (value.length < 8)
      return 'la contraseña es menor de 8 caracteres';
    else if (!regex.hasMatch(value))
      return 'no es alfanumerico con mayuscula y minuscula';
    else
      return null;
  }
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
