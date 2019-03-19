import 'package:flutter/material.dart';

import './pages/joke.dart';
import './resources/repository.dart';

class ChuckApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chuck's Best",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: JokePage(JokesRepository()),
    );
  }
}
