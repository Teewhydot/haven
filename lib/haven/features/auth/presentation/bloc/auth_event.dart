part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthRequestedEvent extends AuthEvent {
  final String phoneNumber;
  AuthRequestedEvent(this.phoneNumber);
}

class AuthConfirmEvent extends AuthEvent {
  final String verificationId;
  final String smsCode;
  AuthConfirmEvent(this.verificationId, this.smsCode);
}
