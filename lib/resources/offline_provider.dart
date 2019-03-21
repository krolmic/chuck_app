import 'dart:math';

import './base_provider.dart';

class OfflineJokesProvider implements JokesProvider {
  OfflineJokesProvider();

  List<String> offlineJokes = <String>[
    'When Chuck Norris tears out your heart and squeezes with one hand,'
    ' the immense pressure results in a blood diamond',
    'Some say that Chuck Norris can see his own forehead.',
    'The Dream lives Chuck Norris.',
    'Chuck Norris shaves by simply scraping his fingernails across his cheeks.',
    'Chuck Norris can knock something without trying it.',
    'Chuck Norris can solve the Towers of Hanoi in one move.',
    'Chuck Norris follows everyone on Twitter... and in real life...'
    ' at the same time.',
    'Chuck Norris plays bingo with a paint ball gun.',
    'People cut their own hair, Chuck Norris pulls his own teeth',
    'Chuck Norris strikes fear into zombies.',
    'Aliens have been abducted by Chuck Norris.',
  ];

  @override
  Future<String> fetchRandomJoke() async {
    final Random random = Random();
    return offlineJokes[random.nextInt(offlineJokes.length)];
  }
}
