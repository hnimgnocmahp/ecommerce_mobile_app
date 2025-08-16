import 'package:dartz/dartz.dart';

import '../../../data/models/auth/check_email.dart';
import '../../../data/models/auth/signin_user_reg.dart';

abstract class AuthRepository {
  Future<Either> signIn(SigningUserReg signingUserReg);
  Future<Either> checkEmail(CheckEmailRequest  CheckEmailRequest );
}