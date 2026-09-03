import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/login_response.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_response.dart';

class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  Dio dio =Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<RegisterResponse> register(RegisterRequest request) async{
    final response = await dio.post(ApiConstants.registerEndPoint,data: request.toJson());
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse>login(LoginRequest request)async{
    final response=await dio.post(ApiConstants.loginEndPoint,data: request.toJson());
    return LoginResponse.fromJson(response.data);
  }


}