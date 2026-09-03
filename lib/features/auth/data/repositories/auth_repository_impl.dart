import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response.dart';
import 'package:ecommerce_app/features/auth/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authApiRemoteDataSource;
  AuthRepositoryImpl({required this.authApiRemoteDataSource});
  @override
  Future<RegisterResponse>register(RegisterRequest request) {
    return authApiRemoteDataSource.register(request);
  }

  @override
  Future<LoginResponse> login(LoginRequest request) {
    return authApiRemoteDataSource.login(request);
  }
  
}