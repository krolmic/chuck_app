import 'dart:convert' as convert;
import 'dart:async';

import 'package:http/http.dart' as http;

import './base_provider.dart';

class ApiJokesProvider implements JokesProvider {
  http.Client client = http.Client();
  final String url;

  ApiJokesProvider(this.url);

  Future<String> fetchRandomJoke() async {
    String joke;
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      try {
        var jsonResponse = convert.jsonDecode(response.body);
        joke = jsonResponse['value'];
      } catch (e) {
        print(e.toString());
        joke = null;
      }
    }
    return joke;
  }
}
