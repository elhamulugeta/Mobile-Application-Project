class UsersModel {
  final String name;
  final String password;
  final String? role;

  UsersModel(
    {required this.name,
    required this.password,
    this.role,
    }); 


  factory UsersModel.fromJson(Map<String, dynamic> json){
    return UsersModel(
      name: json['name'],
      password: json['password'],
      role: json['role']
    );
  }

}  

