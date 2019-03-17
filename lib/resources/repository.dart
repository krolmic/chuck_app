import './base_provider.dart';
import './api_provider.dart';
import './offline_provider.dart';

class JokesRepository {
  List<JokesProvider> providers = <JokesProvider> [
    ApiJokesProvider("https://api.chucknorris.io/jokes/random"),
    OfflineJokesProvider(),
  ];

  Future<String> fetchRandomJoke() async {
    String joke;
    for (JokesProvider provider in providers) {
      joke = await provider.fetchRandomJoke();
      if (joke != null) {
        break;
      }
    }
    return joke;
  }
}