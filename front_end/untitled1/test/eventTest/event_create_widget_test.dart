import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/events/ui/create_events.dart';


void main() {
  testWidgets('NewEvents Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: NewEvents(),
      ),
    ));

    // Verify that the title text is displayed
    expect(find.text('Create a New Event'), findsOneWidget);

    // Enter values in the text fields
    await tester.enterText(find.byType(TextFormField).at(0), 'New Description');
    await tester.enterText(find.byType(TextFormField).at(1), 'New Date');
    await tester.enterText(find.byType(TextFormField).at(2), 'New Time');
    await tester.pump();

    // Verify that the entered values are updated
    expect(find.text('New Description'), findsOneWidget);
    expect(find.text('New Date'), findsOneWidget);
    expect(find.text('New Time'), findsOneWidget);

    // Tap the Create button
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    // Verify that the widget is disposed and popped from the stack
    expect(find.byType(NewEvents), findsNothing);
  });
}
