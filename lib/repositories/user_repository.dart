import 'package:finote/model/user_model.dart';
import 'package:finote/services/api_service.dart';
import 'package:fpdart/fpdart.dart';

class UserRepository {
  final apiService = ApiService();

  Future<Either<String, UserModel>> getCurrentUser() async {
    try {
      final result = await apiService.getCurrentUser();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> updateCurrentUsername(
    UserModel requestBody,
  ) async {
    try {
      final result = await apiService.updateCurrentUsername(
        requestBody.name!,
        requestBody.validatePassword!,
      );
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> updateCurrentPassword(
    UserModel requestBody,
  ) async {
    try {
      final result = await apiService.updateCurrentPassword(
        requestBody.password!,
        requestBody.validatePassword!,
      );
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
