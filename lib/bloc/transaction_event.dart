part of 'transaction_bloc.dart';

@immutable
sealed class TransactionEvent {}

class CreateTransaction extends TransactionEvent {
  final TransactionModel requestBody;
  CreateTransaction(this.requestBody);
}

class GetTransactions extends TransactionEvent {}

class GetDetailTransaction extends TransactionEvent {
  final int id;
  GetDetailTransaction(this.id);
}

class UpdateTransaction extends TransactionEvent {
  final TransactionModel requestBody;
  UpdateTransaction(this.requestBody);
}

class DeleteTransaction extends TransactionEvent {
  final int id;
  DeleteTransaction(this.id);
}
