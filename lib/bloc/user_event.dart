part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetCurrentUserEvent extends UserEvent {}

class UpdateCurrentUsernameEvent extends UserEvent {
  final UserModel requestBody;
  UpdateCurrentUsernameEvent(this.requestBody);
}

class UpdateCurrentPasswordEvent extends UserEvent {
  final UserModel requestBody;
  UpdateCurrentPasswordEvent(this.requestBody);
}
