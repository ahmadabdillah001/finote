part of 'transaction_bloc.dart';

@immutable
sealed class TransactionState {}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionGetSuccess extends TransactionState {
  final List<TransactionModel> responseData;
  TransactionGetSuccess({required this.responseData});
}
final class TransactionGetDetailSuccess extends TransactionState {
  final TransactionModel responseData;
  TransactionGetDetailSuccess({required this.responseData});
}

final class TransactionCreateSuccess extends TransactionState {
  final TransactionModel responseData;
  TransactionCreateSuccess({required this.responseData});
}

final class TransactionUpdateSuccess extends TransactionState {
  final TransactionModel responseData;
  TransactionUpdateSuccess({required this.responseData});
}

final class TransactionDeleteSuccess extends TransactionState {
  final String responseData;
  TransactionDeleteSuccess({required this.responseData});
}

final class TransactionFailed extends TransactionState {
  final String message;
  TransactionFailed({required this.message});
}
