import 'package:dio/dio.dart';
import 'package:finote/constants/app_constant.dart';
import 'package:finote/model/category_model.dart';
import 'package:finote/model/login_request_model.dart';
import 'package:finote/model/login_response_model.dart';
import 'package:finote/model/register_model.dart';
import 'package:finote/model/transaction_model.dart';
import 'package:finote/utils/session_manager.dart';

class ApiService {
  final String baseUrl = AppConstant.baseUrl;
  final dio = Dio();

  // Login Register
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

  // === Category Model ===

  // create category
  Future<CategoryModel> createCategory(CategoryModel requestBody) async {
    final tokenActive = await SessionManager().getAccessToken();
    final response = await dio.post(
      '$baseUrl/categories',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenActive',
        },
      ),
      data: requestBody.toJson(),
    );
    return CategoryModel.fromJson(response.data['data']);
  }

  // get categories
  Future<List<CategoryModel>> getCategories() async {
    final tokenActive = await SessionManager().getAccessToken();
    final response = await dio.get(
      '$baseUrl/categories',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenActive',
        },
      ),
    );
    final List data = response.data['data'] as List;
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }

  // get detail category
  Future<CategoryModel> getDetailCategory(int id) async {
    final tokenActive = await SessionManager().getAccessToken();
    final response = await dio.get(
      '$baseUrl/categories/$id',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenActive',
        },
      ),
    );
    return CategoryModel.fromJson(response.data['data']);
  }

  // update category
  Future<CategoryModel> updateCategory(CategoryModel requestBody) async {
    final tokenActive = await SessionManager().getAccessToken();
    final response = await dio.put(
      '$baseUrl/categories/${requestBody.id}',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenActive',
        },
      ),
      data: requestBody.toJson(),
    );
    return CategoryModel.fromJson(response.data['data']);
  }

  // delete category
  Future<String> deleteCategory(int id) async {
    final tokenActive = await SessionManager().getAccessToken();
    final response = await dio.delete(
      '$baseUrl/categories/$id',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenActive',
        },
      ),
    );
    return response.data['data'];
  }

  // === Transaction Model ===

  // create transaction
  Future<TransactionModel> createTransaction(
    TransactionModel requestBody,
  ) async {
    final tokenActive = await SessionManager().getAccessToken();
    final response = await dio.post(
      '$baseUrl/transactions',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenActive',
        },
      ),
      data: requestBody.toJson(),
    );
    return TransactionModel.fromJson(response.data['data']);
  }

  // get transactions
  Future<List<TransactionModel>> getTransactions() async {
    final tokenActive = await SessionManager().getAccessToken();
    final response = await dio.get(
      '$baseUrl/transactions',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenActive',
        },
      ),
    );
    final List data = response.data['data'] as List;
    return data.map((e) => TransactionModel.fromJson(e)).toList();
  }

  // get detail transaction
  Future<TransactionModel> getDetailTransaction(int id) async {
    final tokenActive = await SessionManager().getAccessToken();
    final response = await dio.get(
      '$baseUrl/transactions/$id',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenActive',
        },
      ),
    );
    return TransactionModel.fromJson(response.data['data']);
  }

  // update transaction
  Future<TransactionModel> updateTransaction(
    TransactionModel requestBody,
  ) async {
    final tokenActive = await SessionManager().getAccessToken();
    final response = await dio.put(
      '$baseUrl/transactions/${requestBody.id}',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenActive',
        },
      ),
      data: requestBody.toJson(),
    );
    return TransactionModel.fromJson(response.data['data']);
  }

  // delete transaction
  Future<String> deleteTransaction(int id) async {
    final tokenActive = await SessionManager().getAccessToken();
    final response = await dio.delete(
      '$baseUrl/transactions/$id',
      options: Options(headers: {'Authorization': 'Bearer $tokenActive'}),
    );
    return response.data['data'];
  }
}
