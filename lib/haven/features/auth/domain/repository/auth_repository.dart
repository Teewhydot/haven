import 'package:dartz/dartz.dart';
import 'package:haven/haven/domain/entities/user_entity.dart';
import 'package:haven/haven/domain/failures/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, Success>> signInWithPhoneNumber(String phoneNumber);
  Future<Either<Failure, UserEntity>> confirmPhoneCode(
    String verificationId,
    smsCode,
  );
}
