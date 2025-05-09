import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:haven/haven/domain/entities/user_entity.dart';

import '../../../../../core/services/firebase_service.dart';
import '../../../../../domain/failures/failures.dart';

abstract class AuthDataSource {
  Future<Either<Failure, OtpSentSuccess>> signInWithPhoneNumber(
    String phoneNumber,
  );

  Future<Either<Failure, UserEntity>> confirmPhoneCode(
    String verificationId,
    smsCode,
  );
}

class AuthDataSourceFirebase implements AuthDataSource {
  final _firebaseService = GetIt.instance<FirebaseService>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, OtpSentSuccess>> signInWithPhoneNumber(
    String phoneNumber,
  ) async {
    final result = await _firebaseService.runWithConfig(
      "SignInWithPhoneNumber",
      () => _firebaseAuth.signInWithPhoneNumber(phoneNumber),
    );
    return Right(OtpSentSuccess(verificationId: result.verificationId));
  }

  @override
  Future<Either<Failure, UserEntity>> confirmPhoneCode(
    String verificationId,
    smsCode,
  ) async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    final result = await _firebaseService.runWithConfig(
      "SignInWithPhoneNumber",
      () => _firebaseAuth.signInWithCredential(credential),
    );
    final UserEntity user = UserEntity(
      accountID: result.user?.uid,
      phoneNumber: result.user?.phoneNumber,
      email: result.user?.email,
      firstName: result.user?.displayName,
      lastName: result.user?.displayName,
      imageUrl: result.user?.photoURL,
    );
    return Right(user);
  }
}
