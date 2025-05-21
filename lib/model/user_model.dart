class UserModel {
  int? id;
  String name;
  String email;
  String? password;

  UserModel({this.id, required this.name, required this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'password': password,
  };
}