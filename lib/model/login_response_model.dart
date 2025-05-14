class LoginResponseModel {
  final String accessToken;

  LoginResponseModel({required this.accessToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(accessToken: json["access_token"]);
}
