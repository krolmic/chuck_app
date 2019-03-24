import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chuck/app.dart';

void main() {
  testWidgets('Joke changes smoke test', (WidgetTester tester) async {
    // There is no joke after starting the app
    await tester.pumpWidget(ChuckApp());
    expect(find.text('Tap on the button to get a Chuck Norris joke.'),
        findsOneWidget);

    // Get a new joke
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('Tap on the button to get a Chuck Norris joke.'),
        findsNothing);

    // Test the refresh indicator
    await tester.fling(find.byType(Image), const Offset(0, 300), 1000);
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
  });
}
