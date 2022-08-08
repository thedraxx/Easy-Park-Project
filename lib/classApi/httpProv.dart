import 'package:easy_park/class/Proveedores.dart';
import 'package:http/http.dart' as http;

class Apisprov {
  Future<List<Proveedores>> fetchProveedores() async {
    final response = await http.get(Uri.parse(
        'https://test-web-c2000-default-rtdb.firebaseio.com/proveedores.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return proveedoresFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
