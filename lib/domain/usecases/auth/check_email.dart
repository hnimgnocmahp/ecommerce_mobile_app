import 'package:dartz/dartz.dart';
import 'package:ecommerce_mobile_app/core/usecase/usecase.dart';
import 'package:ecommerce_mobile_app/data/models/auth/signin_user_reg.dart';

import '../../../data/models/auth/check_email.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';

class CheckEmailUseCase implements UseCase<Either, CheckEmailRequest> {
  @override
  Future<Either> call({required CheckEmailRequest params}) {
    return sl<AuthRepository>().checkEmail(params);
  }


}