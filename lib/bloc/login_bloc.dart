import 'package:finote/model/login_request_model.dart';
import 'package:finote/model/login_response_model.dart';
import 'package:finote/repositories/login_repository.dart';
import 'package:finote/utils/session_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final repository = LoginRepository();
  LoginBloc() : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(LoginLoading());
      final result = await repository.login(event.requestBody);
      result.fold((errorMessage) => emit(LoginFailed(errorMessage)), (
        loginData,
      ) {
        final sesionManager = SessionManager();
        sesionManager.saveSession(loginData.accessToken);
        emit(LoginSuccess(loginData));
      });
    });
  }
}
