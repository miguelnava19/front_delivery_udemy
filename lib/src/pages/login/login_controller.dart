import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/models/response_api.dart';
import 'package:flutter_delivery/src/models/user.dart';
import 'package:flutter_delivery/src/provider/users_provider.dart';
import 'package:flutter_delivery/src/utils/my_snackbar.dart';
import 'package:flutter_delivery/src/utils/shared_pref.dart';

class LoginController {
  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider userProvider = new UsersProvider();
  SharedPref _sharePref = new SharedPref();

  Future init(BuildContext context) async{
    this.context = context;
    await userProvider.init(context);
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    ResponseApi? response = await userProvider.login(email, password);
  print(response?.toJson());

    if(response != null && response.success){
      User user = User.fromJson(response.data);

      _sharePref.save('user', user.toJson());
      Navigator.pushNamedAndRemoveUntil(context!, 'client/products/list', (route) => false);
    }else{
      Mysnackbar.show(context!, response?.message ?? "Error!");
    }
  }
}
