import 'package:flutter/material.dart';

import '../resources/repository.dart';

class JokePage extends StatefulWidget {
  final JokesRepository jokesRepository;

  JokePage(this.jokesRepository, {Key key}) : super(key: key);

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
        ? Center(child: CircularProgressIndicator())
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
        padding: EdgeInsets.all(15),
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.8,
            child: Image.asset('assets/chuck_norris.png'),
          ),
          SizedBox(
            height: 15,
          ),
          _buildContent(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getJoke,
        tooltip: 'Get a Joke',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
