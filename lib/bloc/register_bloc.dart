import 'package:finote/model/register_model.dart';
import 'package:finote/repositories/register_repository.dart';
import 'package:finote/utils/session_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final repository = RegisterRepository();
  RegisterBloc() : super(RegisterInitial()) {
    on<Register>((event, emit) async {
      emit(RegisterLoading());
      final result = await repository.register(event.requestBody);
      result.fold((errorMessage) => emit(RegisterFailed(errorMessage)), (
        registerData,
      ) async {
        final sesionManager = SessionManager();
        await sesionManager.removeSession();
        sesionManager.saveSession(registerData.tokenData!);
        emit(RegisterSuccess(registerData));
      });
    });
  }
}
