import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/events/ui/edit_events.dart';

void main() {
  testWidgets('EditEvents Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: EditEvents(),
      ),
    ));

    // Verify that the title text is displayed
    expect(find.text('Edit Event'), findsOneWidget);

    // Verify that the text fields are displayed
    expect(find.byType(TextField), findsNWidgets(4));

    // Enter values in the text fields
    await tester.enterText(find.byType(TextField).at(0), 'New Title');
    await tester.enterText(find.byType(TextField).at(1), 'New Description');
    await tester.enterText(find.byType(TextField).at(2), 'New Date');
    await tester.enterText(find.byType(TextField).at(3), 'New Time');
    await tester.pump();

    // Verify that the entered values are updated
    expect(find.text('New Title'), findsOneWidget);
    expect(find.text('New Description'), findsOneWidget);
    expect(find.text('New Date'), findsOneWidget);
    expect(find.text('New Time'), findsOneWidget);

    // Tap the Save button
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    // Verify that the dialog is closed
    expect(find.byType(AlertDialog), findsNothing);
  });
}
