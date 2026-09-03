import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:ecommerce_app/features/auth/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit({required this.authRepository}):super(InitialState());
  AuthRepository authRepository;
  
  void register(RegisterRequest request)async{
    try{
      emit(RegisterLoading());
       await authRepository.register(request);
      emit(RegisterSuccess());
    }catch(exception){
      emit(RegisterError(message: exception.toString()));
    }
  }

  void login(LoginRequest request)async{
    try{
      emit(LoginLoading());
      await authRepository.login(request);
      emit(LoginSuccess());
    }catch (exception){
      emit(LoginError(message: exception.toString()));
    }
  }

}

class AuthState{}
class InitialState extends AuthState{}
class RegisterLoading extends AuthState{}
class RegisterError extends AuthState{
  String message;
  RegisterError({required this.message});
}
class RegisterSuccess extends AuthState{}
class LoginLoading extends AuthState{}
class LoginError extends AuthState{
  String message;
  LoginError({required this.message});
}
class LoginSuccess extends AuthState{}