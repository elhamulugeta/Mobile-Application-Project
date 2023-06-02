import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/events/repositories/eventGetRepository.dart';
import 'package:untitled1/events/bloc/events_bloc.dart';
import 'package:untitled1/events/ui/events.dart';

class MockEventsRepository extends Mock implements EventsRepository {}

void main() {
  late MockEventsRepository mockRepository;

  setUp(() {
    mockRepository = MockEventsRepository();
  });

  group('EventsPage', () {
    testWidgets('renders EventsPage correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(
            providers: [
              Provider<EventsRepository>(
                create: (_) => mockRepository,
              ),
            ],
            child: EventsPage(),
          ),
        ),
      );

      expect(find.text('Events'), findsOneWidget); expect(find.byType(EventsPage), findsOneWidget);

    // Verify that the app bar is displayed
      expect(find.byType(AppBar), findsOneWidget);

      // Verify that the "Add" button is displayed
      expect(find.byIcon(Icons.add_rounded), findsOneWidget);

   
      expect(find.byType(Card), findsNothing);
    });

  });
}


