class EventsModel {
  final String description;
  final String date;
  final String time;
  final String id;

  EventsModel(
    {required this.description,
    required this.date,
    required this.time,
    required this.id,
    }); 


  factory EventsModel.fromJson(Map<String, dynamic> json){
    return EventsModel(
      id: "",
      description: json['description'],
      date: json['date'],
      time: json['time'],
    );
  }

}  

