import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../models/auth/check_email.dart';
import '../../models/auth/signin_user_reg.dart';

abstract class AuthApiService {
  Future<Either> signin(SigningUserReg signingUserReg);
  Future<Either> checkEmail(CheckEmailRequest  CheckEmailRequest);
}

class AuthApiServiceImpl implements AuthApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8080/api/auth"));
  @override
  Future<Either> signin(SigningUserReg signingUserReg) async{
    final response = await dio.post(
      "/login",
      data: signingUserReg.toJson(),
      options: Options(
        validateStatus: (status) => true
      )
    );
    if (response.statusCode == 200) {
      return Right(response.data);
    } else {
      return Left(response.data['message'] ?? 'Something was wrong');
    }
  }

  @override
  Future<Either> checkEmail(CheckEmailRequest CheckEmailRequest) async{
    final response = await dio.post(
      "/check-email",
      data: CheckEmailRequest.toJson(),
      options: Options(
        validateStatus: (status) => true
      ),
    );

    if (response.statusCode == 200) {
      return Right(response.data);
    } else {
      return Left(response.data['message'] ?? 'Something was wrong');
    }
  }
}