class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? validatePassword;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.validatePassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(id: json['id'], name: json['name'], email: json['email']);

  Map<String, dynamic> toJson() => {
    'name': name,
    'password': password,
    'validate_password' : validatePassword
  };
}
