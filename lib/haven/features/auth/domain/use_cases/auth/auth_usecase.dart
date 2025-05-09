import 'package:dartz/dartz.dart';
import 'package:haven/haven/domain/entities/user_entity.dart';
import 'package:haven/haven/features/auth/data/repository_impl/auth_repo_impl.dart';

import '../../../../../domain/failures/failures.dart';

class AuthUseCase {
  final authRepo = AuthRepoImpl();
  Future<Either<Failure, OtpSentSuccess>> signInWithPhoneNumber(
    String phoneNumber,
  ) async {
    return await authRepo.signInWithPhoneNumber(phoneNumber);
  }

  Future<Either<Failure, UserEntity>> confirmPhoneCode(
    String verificationId,
    smsCode,
  ) async {
    return await authRepo.confirmPhoneCode(verificationId, smsCode);
  }
}
