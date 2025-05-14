part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class Register extends RegisterEvent {
  final RegisterModel requestBody;

  Register(this.requestBody);
}
