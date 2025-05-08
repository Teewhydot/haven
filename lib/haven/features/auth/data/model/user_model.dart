import 'package:haven/haven/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.accountID,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accountID: json['accountID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }
}
