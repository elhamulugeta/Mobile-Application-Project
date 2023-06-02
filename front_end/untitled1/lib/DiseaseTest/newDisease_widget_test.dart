import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/diseases/ui/create_diseases.dart';

void main() {
  testWidgets('Verify entering text in NewDiseases form', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NewDiseases()));

    // Enter text in title field
    await tester.enterText(find.byType(TextFormField).at(0), 'Sample Title');
    await tester.pump();

    // Enter text in symptoms field
    await tester.enterText(find.byType(TextFormField).at(1), 'Sample Symptoms');
    await tester.pump();

    // Enter text in date field
    await tester.enterText(find.byType(TextFormField).at(2), '2023-06-01');
    await tester.pump();

    // Tap the Create button
    await tester.tap(find.text('Create'));
    await tester.pumpAndSettle();

    // Verify that the form is submitted and the NewDiseases widget is popped
    expect(find.byType(NewDiseases), findsNothing);
  });
}
