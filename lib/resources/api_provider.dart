import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import './base_provider.dart';

class ApiJokesProvider implements JokesProvider {
  ApiJokesProvider(this.url);

  http.Client client = http.Client();
  final String url;

  @override
  Future<String> fetchRandomJoke() async {
    String joke;
    final http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      try {
        final dynamic jsonResponse = convert.jsonDecode(response.body);
        joke = jsonResponse['value'];
      } catch (e) {
        print(e.toString());
        joke = null;
      }
    }
    return joke;
  }
}
