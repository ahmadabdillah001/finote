class RegisterModel {
  int? id;
  String? tokenData;
  String name;
  String email;
  String password;

  RegisterModel({
    this.id,
    this.tokenData,
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    id: json['id'],
    tokenData: json['token_type'],
    name: json['name'],
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
  };
}

// {
//     "token_type": "Bearer",
//     "access_token": "7|5MUyxiSNM27FhFV6kqwit5jmwxMSD9ktwXVVC8opf3d7dce7",
//     "user": {
//         "name": "adil",
//         "email": "abdillah@gmail.com",
//         "updated_at": "2025-05-13T23:36:54.000000Z",
//         "created_at": "2025-05-13T23:36:54.000000Z",
//         "id": 4
//     }
// }
