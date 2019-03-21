import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:chuck/app.dart';

void main() {
  testWidgets('Joke changes smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(ChuckApp());

    expect(find.text('Tap on the button to get a Chuck Norris joke.'),
        findsOneWidget);

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // The joke has been updated
    expect(find.text('Tap on the button to get a Chuck Norris joke.'),
        findsNothing);
  });
}
