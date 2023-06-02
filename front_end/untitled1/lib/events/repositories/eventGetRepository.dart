import 'dart:convert';
import 'package:untitled1/events/models/events_model.dart';
import 'package:http/http.dart';

class EventsRepository {
  String endpoint = 'http://localhost:5000/event';

  Future<List<EventsModel>> getUser() async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => EventsModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<EventsModel> addEvent(Map<String, dynamic> newEvent) async {
    Response response = await post(
      Uri.parse(endpoint + "/addEvent"),
      body: newEvent,
    );

    if (response.statusCode == 201) {
      final newEvent = jsonDecode(response.body);

      return EventsModel.fromJson(newEvent);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  // Future<EventsModel> updateEvent(Map<String, > newEvent) async {
  //   Response response = await put(
  //     Uri.parse(endpoint),
  //     body: newEvent,
  //   );

  //   if (response.statusCode == 204) {
  //     final updatedEvent = jsonDecode(response.body);

  //     return EventsModel.fromJson(updatedEvent);
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
   Future<void> updateEvent(int id,  updatedEvent) async {
    final url = Uri.parse('/event/$id');
    final response = await put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedEvent.toJson()),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to update event');
    }
  }
}

  // Future<bool> deleteEvent(String id) async {
  //   Response response = await delete(
  //     Uri.parse(endpoint),
  //     body: {id},
  //   );

  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }


