import 'package:bloc/bloc.dart';
import 'package:finote/model/register_model.dart';
import 'package:finote/repositories/register_repository.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final repository = RegisterRepository();
  RegisterBloc() : super(RegisterInitial()) {
    on<Register>((event, emit) async {
      emit(RegisterLoading());
      final result = await repository.register(event.requestBody);
      result.fold(
        (l) => emit(RegisterFailed(l)),
        (r) => emit(RegisterSuccess(r)),
      );
    });
  }
}
