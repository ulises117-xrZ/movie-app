import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class RepositoryDefault {
  Future<dynamic> metodoGET({
    String urlBase,
  }) async {
    try {
      final response =
          (await http.get(Uri.parse(urlBase)).timeout(Duration(seconds: 15)));
      if (response.statusCode == 200) {
        print("----------Respuesta-------------");
        return response.body;
      } else {
        print('status code: ${response.statusCode}');
        return null;
      }
      //la linea else se ejecuta cuando el usuario no esta logueado
      //Ahorita esta configurado para llamar las canchas
      //el useHeaders es cuando hacemos una peticion, si es false, no queremos headers
    } catch (e) {
      print(e);
      return null;
    }
  }
}
