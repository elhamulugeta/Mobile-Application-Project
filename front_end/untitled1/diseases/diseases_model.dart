class DiseasesModel {
  final String symptom;
  final String title;

  DiseasesModel(
    {required this.symptom,
    required this.title,
    }); 


  factory DiseasesModel.fromJson(Map<String, dynamic> json){
    return DiseasesModel(
      title: json['title'],
      symptom: json['symptom'],
    );
  }

}  
