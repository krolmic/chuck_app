import 'package:flutter/material.dart';

import '../resources/repository.dart';

class JokePage extends StatefulWidget {
  const JokePage(this.jokesRepository, {Key key}) : super(key: key);

  final JokesRepository jokesRepository;

  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  bool _isLoading = false;
  String _joke = 'Tap on the button to get a Chuck Norris joke.';

  final JokesRepository _jokesRepository = JokesRepository();

  void _getJoke() async {
    // Fetch a new joke only if the page is not loading
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      final String joke = await _jokesRepository.fetchRandomJoke();

      setState(() {
        _joke = joke;
        _isLoading = false;
      });
    }
  }

  Widget _buildContent() {
    return _isLoading
        ? Center(
            child: const CircularProgressIndicator(),
          )
        : Text(
            '$_joke',
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(fontFamily: 'Times'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chuck's Best",
          style: TextStyle(
            fontFamily: 'Bevan',
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.8,
            child: Image.asset('assets/chuck_norris.png'),
          ),
          const SizedBox(
            height: 15,
          ),
          _buildContent(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getJoke,
        tooltip: 'Get a Joke',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
