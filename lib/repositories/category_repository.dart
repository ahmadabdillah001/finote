import 'package:finote/model/category_model.dart';
import 'package:finote/services/api_service.dart';
import 'package:fpdart/fpdart.dart';

class CategoryRepository {
  final apiService = ApiService();

  // create data
  Future<Either<String, CategoryModel>> createCategory(
    CategoryModel requestBody,
  ) async {
    try {
      final result = await apiService.createCategory(requestBody);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // get data
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      final result = await apiService.getCategories();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // get detail data
  Future<Either<String, CategoryModel>> getDetailCategory(int id) async {
    try {
      final result = await apiService.getDetailCategory(id);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // update data
  Future<Either<String, CategoryModel>> updateCategory(
    CategoryModel requestBody,
  ) async {
    try {
      final result = await apiService.updateCategory(requestBody);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // delete data
  Future<Either<String, String>> deleteCategory(int id) async {
    try {
      await apiService.deleteCategory(id);
      return Right('Success Delete Category');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
