import 'package:finote/model/transaction_model.dart';
import 'package:finote/repositories/transaction_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final repository = TransactionRepository();
  TransactionBloc() : super(TransactionInitial()) {
    on<CreateTransaction>((event, emit) async {
      emit(TransactionLoading());
      final result = await repository.createTransaction(event.requestBody);
      result.fold(
        (l) => emit(TransactionFailed(message: l)),
        (r) => emit(TransactionCreateSuccess(responseData: r)),
      );
      add(GetTransactions());
    });

    on<GetTransactions>((event, emit) async {
      emit(TransactionLoading());
      final result = await repository.getTransactions();
      result.fold(
        (l) => emit(TransactionFailed(message: l)),
        (r) => emit(TransactionGetSuccess(responseData: r)),
      );
    });

    on<GetDetailTransaction>((event, emit) async {
      emit(TransactionLoading());
      final result = await repository.getDetailTransaction(event.id);
      result.fold(
        (l) => emit(TransactionFailed(message: l)),
        (r) => emit(TransactionGetDetailSuccess(responseData: r)),
      );
    });

    on<UpdateTransaction>((event, emit) async {
      emit(TransactionLoading());
      final result = await repository.updateTransaction(
        event.requestBody,
      );
      result.fold(
        (l) => emit(TransactionFailed(message: l)),
        (r) => emit(TransactionUpdateSuccess(responseData: r)),
      );
      add(GetTransactions());
    });

    on<DeleteTransaction>((event, emit) async {
      emit(TransactionLoading());
      final result = await repository.deleteTransaction(event.id);
      result.fold(
        (l) => emit(TransactionFailed(message: l)),
        (r) => emit(TransactionDeleteSuccess(responseData: r)),
      );
      add(GetTransactions());
    });
  }
}
