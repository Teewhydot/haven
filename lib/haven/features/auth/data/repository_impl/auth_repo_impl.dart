import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:haven/haven/features/auth/data/local/data_sources/auth_data_source.dart';
import 'package:haven/haven/features/auth/domain/repository/auth_repository.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/failures/failures.dart';

class AuthRepoImpl implements AuthRepository {
  final authService = GetIt.instance<AuthDataSource>();

  @override
  Future<Either<Failure, Success>> signInWithPhoneNumber(
    String phoneNumber,
  ) async {
    return await authService.signInWithPhoneNumber(phoneNumber);
  }

  @override
  Future<Either<Failure, UserEntity>> confirmPhoneCode(
    String verificationId,
    smsCode,
  ) async {
    return await authService.confirmPhoneCode(verificationId, smsCode);
  }
}
