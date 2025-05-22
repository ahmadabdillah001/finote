import 'package:finote/model/transaction_model.dart';
import 'package:finote/services/api_service.dart';
import 'package:fpdart/fpdart.dart';

class TransactionRepository {
  final apiService = ApiService();

  // create transaction
  Future<Either<String, TransactionModel>> createTransaction(
    TransactionModel requestBody,
  ) async {
    try {
      final result = await apiService.createTransaction(requestBody);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // get transactions
  Future<Either<String, List<TransactionModel>>> getTransactions() async {
    try {
      final result = await apiService.getTransactions();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // get detail transaction
  Future<Either<String, TransactionModel>> getDetailTransaction(int id) async {
    try {
      final result = await apiService.getDetailTransaction(id);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // update transactio
  Future<Either<String, TransactionModel>> updateTransaction(
    TransactionModel requestBody,
  ) async {
    try {
      final result = await apiService.updateTransaction(requestBody);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  // delete transaction
  Future<Either<String, String>> deleteTransaction(int id) async {
    try {
      await apiService.deleteTransaction(id);
      return Right('Succedd Delete Transaction');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
