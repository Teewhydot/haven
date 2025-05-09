part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final String verificationId;
  AuthSuccessState(this.verificationId);
}

final class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}

final class AuthConfirmSuccessState extends AuthState {
  final UserEntity userEntity;
  AuthConfirmSuccessState(this.userEntity);
}
