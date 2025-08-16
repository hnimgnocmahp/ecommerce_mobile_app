import 'package:dartz/dartz.dart';
import 'package:ecommerce_mobile_app/core/usecase/usecase.dart';
import 'package:ecommerce_mobile_app/data/models/auth/signin_user_reg.dart';

import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class SignInUseCase implements UseCase<Either, SigningUserReg> {
  @override
  Future<Either> call({required SigningUserReg params}) {
    return sl<AuthRepository>().signIn(params);
  }


}