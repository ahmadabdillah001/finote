part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class LoadingUserState extends UserState {}

final class GetUserSuccess extends UserState {
  final UserModel responseBody;
  GetUserSuccess(this.responseBody);
}

final class UpdateUserSuccess extends UserState {
  final String responseBody;
  UpdateUserSuccess(this.responseBody);
}

final class FailedUserState extends UserState {
  final String message;
  FailedUserState(this.message);
}
