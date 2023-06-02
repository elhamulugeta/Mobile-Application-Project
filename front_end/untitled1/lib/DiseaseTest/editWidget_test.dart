import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled1/diseases/ui/edit_diseases.dart';

void main() {
  testWidgets('Verify entering text in EditDiseases dialog', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: EditDiseases()));

    // Enter text in title field
    await tester.enterText(find.byType(TextField).at(0), 'Updated Title');
    await tester.pump();

    // Enter text in symptoms field
    await tester.enterText(find.byType(TextField).at(1), 'Updated Symptoms');
    await tester.pump();

    // Enter text in date field
    await tester.enterText(find.byType(TextField).at(2), '2023-06-02');
    await tester.pump();

    // Tap the Save button
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    // Verify that the dialog is closed
    expect(find.byType(EditDiseases), findsNothing);
  });
}
