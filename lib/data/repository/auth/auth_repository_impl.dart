import 'package:dartz/dartz.dart';
import 'package:ecommerce_mobile_app/data/models/auth/check_email.dart';
import 'package:ecommerce_mobile_app/data/models/auth/signin_user_reg.dart';
import 'package:ecommerce_mobile_app/domain/repository/auth/auth.dart';

import '../../sources/auth/auth_api_service.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signIn(SigningUserReg signingUserReg) async{
    return await AuthApiServiceImpl().signin(signingUserReg);
  }

  @override
  Future<Either> checkEmail(CheckEmailRequest CheckEmailRequest) async{
    return await AuthApiServiceImpl().checkEmail(CheckEmailRequest);
  }
  
}