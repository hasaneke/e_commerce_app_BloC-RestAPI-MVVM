import 'package:e_commerce_app/product/service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/auth/login/models/login_request_model.dart';
import 'package:e_commerce_app/product/model/user/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthService service;

  LoginBloc({required this.service}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      // SIGN IN EVENT
      if (event is SignInEvent) {
        emit(LoginLoadingState());
        //RESPONSE WAITED
        final response = await _postUserModel(
            LoginRequestModel(username: event.email, password: event.password));
        // RESPONSE SUCCEED
        if (response is User) {
          emit(LoginComplete(response));
        } else {
          emit(LoginFailedState("Error"));
        }
        // RESPONSE FAILED
      }
      // NAVIGATE TO REGISTER
      else if (event is NavigateToRegisterEvent) {
        emit(NavigateToRegisterState());
      }
    });
  }

  Future<User?> _postUserModel(LoginRequestModel loginRequestModel) async {
    try {
      return await service.postUserLogin(loginRequestModel);
    } catch (e) {
      return null;
    }
  }
}
