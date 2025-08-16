

import 'package:ecommerce_mobile_app/data/repository/auth/auth_repository_impl.dart';
import 'package:ecommerce_mobile_app/data/sources/auth/auth_api_service.dart';
import 'package:ecommerce_mobile_app/domain/repository/auth/auth.dart';
import 'package:ecommerce_mobile_app/domain/usecases/auth/check_email.dart';
import 'package:ecommerce_mobile_app/domain/usecases/auth/sign_in.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthApiService>(
    AuthApiServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<CheckEmailUseCase>(
    CheckEmailUseCase()
  );

  sl.registerSingleton<SignInUseCase>(
    SignInUseCase()
  );
}