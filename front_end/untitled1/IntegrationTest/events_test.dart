import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled1/events/bloc/events_bloc.dart';
import 'package:untitled1/events/models/events_model.dart';
import 'package:untitled1/events/repositories/eventGetRepository.dart';
import 'package:untitled1/events/ui/events.dart';

class MockEventsRepository extends Mock implements EventsRepository {}

void main() {
  late EventsBloc eventsBloc;
  late MockEventsRepository eventsRepository;

  setUp(() {
    eventsRepository = MockEventsRepository();
    eventsBloc = EventsBloc(eventsRepository);
  });

  tearDown(() {
    eventsBloc.close();
  });

  testWidgets('EventsPage - EventsLoadedState', (WidgetTester tester) async {
    // Mock events data
    List<EventsModel> eventsList = [
      EventsModel(description: 'Event 1'),
      EventsModel(description: 'Event 2'),
      EventsModel(description: 'Event 3'),
    ];

    // Stub the repository's response
    when(eventsRepository.getEvents()).thenAnswer((_) async => eventsList);

    // Pump the EventsPage widget with the EventsLoadedState
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<EventsBloc>.value(
          value: eventsBloc,
          child: EventsPage(),
        ),
      ),
    );

    // Wait for the events to be loaded
    await tester.pumpAndSettle();

    // Verify that the events are displayed correctly
    expect(find.text('Event 1'), findsOneWidget);
    expect(find.text('Event 2'), findsOneWidget);
    expect(find.text('Event 3'), findsOneWidget);
  });

  // Add more tests for other states and interactions as needed

}
