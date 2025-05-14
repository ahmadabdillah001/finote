import 'package:finote/model/login_request_model.dart';
import 'package:finote/model/login_response_model.dart';
import 'package:finote/services/api_service.dart';
import 'package:fpdart/fpdart.dart';

class LoginRepository {
  final apiService = ApiService();

  Future<Either<String, LoginResponseModel>> login(
    LoginRequestModel requestBody,
  ) async {
    try {
      final result = await apiService.login(requestBody);
      return Right(result);
    } catch (e) {
      return Left('login failed');
    }
  }
}
