import 'package:finote/model/register_model.dart';
import 'package:finote/services/api_service.dart';
import 'package:fpdart/fpdart.dart';

class RegisterRepository {
  final apiService = ApiService();

  Future<Either<String, RegisterModel>> register(
    RegisterModel requestBody,
  ) async {
    try {
      final result = await apiService.register(requestBody);
      return Right(result);
    } catch (e) {
      return Left('register failed');
    }
  }
}
