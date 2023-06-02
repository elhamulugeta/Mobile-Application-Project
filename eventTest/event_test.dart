import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled1/events/bloc/events_bloc.dart';
import 'package:untitled1/events/models/events_model.dart';
import 'package:untitled1/events/repositories/eventGetRepository.dart';

// Create a mock class for the EventsRepository
class MockEventsRepository extends Mock implements EventsRepository {}

void main() {
  // Instantiate the mock repository
  late MockEventsRepository mockEventsRepository;

  // Instantiate the eventsBloc using the mock repository
  late EventsBloc eventsBloc;

  setUp(() {
    // Initialize the mock repository and eventsBloc before each test
    mockEventsRepository = MockEventsRepository();
    eventsBloc = EventsBloc(mockEventsRepository);
  });

  test('emits [EventsLoadingState, EventsLoadedState] when events are successfully loaded', () async {
  final event = EventsModel(
    description: 'Event description',
    date: '2023-06-01',
    time: '12:00 PM',
  );
  final eventsList = [event];

  // Set up the mock behavior for getUser() method
  when(mockEventsRepository.getUser()).thenAnswer((_) async => eventsList);

  // Trigger the LoadEventsButtonClickedEvent
  eventsBloc.add(LoadEventsButtonClickedEvent());

  // Expect that the eventsBloc emits the expected states in the correct order
  expectLater(
    eventsBloc.stream,
    emitsInOrder([
      EventsLoadingState(),
      EventsLoadedState(eventsList),
    ]),
  );

  // Wait for the expectations to complete
  await Future.delayed(Duration.zero);

  // Verify that the getUser() method is called once
  verify(mockEventsRepository.getUser()).called(1);
});

  test('emits [EventsLoadingState, EventsErrorState] when events fail to load', () async {
    final error = 'Failed to fetch events';

    // Set up the mock behavior for getUser() method to return null
    when(mockEventsRepository.getUser()).thenAnswer((_) => Future.value(null));

    // Trigger the LoadEventsButtonClickedEvent
    eventsBloc.add(LoadEventsButtonClickedEvent());

    // Verify that the eventsBloc emits the expected states in the correct order
    expectLater(
      eventsBloc.stream,
      emitsInOrder([
        EventsLoadingState(),
        EventsErrorState(error),
      ]),
    );

    // Verify that the getUser() method is called once
    verify(mockEventsRepository.getUser()).called(1);
  });
}
