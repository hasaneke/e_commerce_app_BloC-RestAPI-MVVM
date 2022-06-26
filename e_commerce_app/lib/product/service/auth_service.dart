import 'package:e_commerce_app/features/auth/login/models/login_request_model.dart';
import 'package:e_commerce_app/product/model/user/user.dart';
import 'package:e_commerce_app/product/network/network_manager.dart';
import 'package:e_commerce_app/product/utility/service_paths.dart';

abstract class IAuthService {
  final ProjectNetworkManager networkManager;
  IAuthService(this.networkManager);
  Future<User?> postUserLogin(LoginRequestModel model);
}

class AuthService extends IAuthService {
  AuthService() : super(ProjectNetworkManager.instance);
  @override
  Future<User?> postUserLogin(LoginRequestModel model) async {
    final response = await networkManager.service
        .post(ServicePaths.login.path, data: model.toJson());
    final jsonBody = response.data;
    if (jsonBody is Map<String, dynamic>) {
      return User.fromJson(jsonBody);
    }
    return null;
  }
}
