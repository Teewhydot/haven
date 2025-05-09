import 'package:bloc/bloc.dart';
import 'package:haven/haven/domain/entities/user_entity.dart';
import 'package:haven/haven/features/auth/domain/use_cases/auth/auth_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase = AuthUseCase();
  AuthBloc() : super(AuthInitial()) {
    on<AuthRequestedEvent>((event, emit) async {
      emit(AuthLoadingState());
      //Fake api call
      await Future.delayed(const Duration(seconds: 2));
      emit(AuthSuccessState("Fake verification ID"));

      // final failureOrSuccess = await _authUseCase.signInWithPhoneNumber(
      //   event.phoneNumber,
      // );
      // failureOrSuccess.fold(
      //   (failure) {
      //     emit(AuthErrorState(failure.failureMessage));
      //   },
      //   (verificationId) {
      //     emit(AuthSuccessState(verificationId.verificationId));
      //   },
      // );
    });

    on<AuthConfirmEvent>((event, emit) async {
      emit(AuthLoadingState());
      await Future.delayed(const Duration(seconds: 5));
      emit(
        AuthConfirmSuccessState(
          UserEntity(
            firstName: "Issa",
            lastName: "Abubakar",
            email: "abubakarissa47722@gmail.com",
            accountID: "tunde",
            phoneNumber: "08068787087",
            imageUrl: "https://example.com/image.jpg",
          ),
        ),
      );
      await Future.delayed(const Duration(seconds: 2));

      // final failureOrSuccess = await _authUseCase.confirmPhoneCode(
      //   event.verificationId,
      //   event.smsCode,
      // );
      // failureOrSuccess.fold(
      //   (failure) {
      //     emit(AuthErrorState(failure.failureMessage));
      //   },
      //   (userEntity) {
      //     emit(AuthConfirmSuccessState(userEntity));
      //   },
      // );
    });
  }
}
