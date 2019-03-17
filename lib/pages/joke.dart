import 'package:flutter/material.dart';

import '../resources/repository.dart';

class JokePage extends StatefulWidget {
  JokePage({Key key}) : super(key: key);

  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  bool _isLoading = false;
  String _joke = "Tap on the button to get a Chuck Norris joke.";

  JokesRepository _jokesRepository = JokesRepository();

  void _getJoke() async {
    // Fetch a new joke only if the page is not loading
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      String joke = await _jokesRepository.fetchRandomJoke();

      setState(() {
        _joke = joke;
        _isLoading = false;
      });
    }
  }

  Widget _buildContent() {
    return _isLoading
        ? CircularProgressIndicator()
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
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: _buildContent(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getJoke,
        tooltip: 'Get a Joke',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
