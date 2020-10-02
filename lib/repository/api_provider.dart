import 'dart:convert';
import 'package:flutter_bloc_pattern/model/GalleryImages.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();
  final _baseUrl =
      "https://jsonplaceholder.typicode.com/photos";

  Future<List<GalleryImages>> fetchData() async {
    final response = await client.get("$_baseUrl"); 
    print(response.body.toString());
     final jsonresponse = json.decode(response.body);

    if (response.statusCode == 200) {
      return GalleryImages.fromJson(jsonresponse[0]);
    } else {
      throw Exception('Failed to load images');
    }
  }
}