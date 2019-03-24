import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

import 'package:chuck/resources/api_provider.dart';
import 'package:chuck/resources/repository.dart';
import './mocks.dart';

void main() {
  group('Resources', () {
    test('Jokes repository test', () async {
      final ClientMock client = ClientMock();

      // Valid JSON response
      http.Response response = http.Response(
          '{"value": "Aliens have been abducted by Chuck Norris."}', 200);

      when(client.get('https://foo.bar'))
          .thenAnswer((_) => Future<http.Response>.value(response));
      final ApiJokesProvider provider = ApiJokesProvider('https://foo.bar');
      provider.client = client;

      final JokesRepository repository = JokesRepository();
      repository.providers[0] = provider;
      expect(await repository.fetchRandomJoke(),
          'Aliens have been abducted by Chuck Norris.');

      // Invalid response
      response = http.Response('{"foo}', 200);
      expect(await provider.fetchRandomJoke(), null);
      // The repository returns a joke from the offline provider
      expect(await repository.fetchRandomJoke(), isNotNull);
    });
  });
}
