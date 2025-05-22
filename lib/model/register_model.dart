class RegisterModel {
  int? id;
  String? tokenData;
  String? name;
  String? email;
  String? password;

  RegisterModel({
    this.id,
    this.tokenData,
    this.name,
    this.email,
    this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      RegisterModel(tokenData: json['access_token']);

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
  };
}