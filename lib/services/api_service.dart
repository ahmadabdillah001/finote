import 'package:dio/dio.dart';
import 'package:finote/constants/app_constant.dart';
import 'package:finote/model/login_request_model.dart';
import 'package:finote/model/login_response_model.dart';
import 'package:finote/model/register_model.dart';

class ApiService {
  final String baseUrl = AppConstant.baseUrl;
  final dio = Dio();

  Future<LoginResponseModel> login(LoginRequestModel requestBody) async {
    final response = await dio.post(
      '$baseUrl/login',
      data: requestBody.toJson(),
    );
    return LoginResponseModel.fromJson(response.data);
  }

  Future<RegisterModel> register(RegisterModel requestBody) async {
    final response = await dio.post(
      '$baseUrl/register',
      data: requestBody.toJson(),
    );
    return RegisterModel.fromJson(response.data);
  }
}
