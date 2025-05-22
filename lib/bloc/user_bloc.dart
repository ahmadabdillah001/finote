import 'package:bloc/bloc.dart';
import 'package:finote/model/user_model.dart';
import 'package:finote/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final repository = UserRepository();
  UserBloc() : super(UserInitial()) {
    on<GetCurrentUserEvent>((event, emit) async {
      emit(LoadingUserState());
      final result = await repository.getCurrentUser();
      result.fold(
        (l) => emit(FailedUserState(l)),
        (r) => emit(GetUserSuccess(r)),
      );
    });

    on<UpdateCurrentUsernameEvent>((event, emit) async {
      emit(LoadingUserState());
      final result = await repository.updateCurrentUsername(event.requestBody);
      result.fold(
        (l) => emit(FailedUserState(l)),
        (r) => emit(UpdateUserSuccess(r)),
      );
      add(GetCurrentUserEvent());
    });

    on<UpdateCurrentPasswordEvent>((event, emit) async {
      emit(LoadingUserState());
      final result = await repository.updateCurrentPassword(event.requestBody);
      result.fold(
        (l) => emit(FailedUserState(l)),
        (r) => emit(UpdateUserSuccess(r)),
      );
      add(GetCurrentUserEvent());
    });
  }
}
