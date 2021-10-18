import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/models/response_api.dart';
import 'package:flutter_delivery/src/models/user.dart';
import 'package:flutter_delivery/src/provider/users_provider.dart';
import 'package:flutter_delivery/src/utils/my_snackbar.dart';

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nombreController = new TextEditingController();
  TextEditingController apellidoController = new TextEditingController();
  TextEditingController telefonoController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordConfirmController = new TextEditingController();

  UsersProvider userProvider = new UsersProvider();

  Future? init(BuildContext context) {
    this.context = context;
    userProvider.init(context);
  }

  void goToLogin() {
    Navigator.pushNamed(context!, 'login');
  }

  void register() async{
    String email = emailController.text.trim();
    String name = nombreController.text;
    String lastname = apellidoController.text;
    String phone = telefonoController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();

    if(email.isEmpty || name.isEmpty || lastname.isEmpty || phone.isEmpty || password.isEmpty || passwordConfirm.isEmpty){
      Mysnackbar.show(context!, 'Debes ingresar todos los campos');
      return;
    }

    if(password.length < 6){
      Mysnackbar.show(context!, 'Las constraseñas deben de tener al menos 6 caracteres.');
      return;
    }

    if(passwordConfirm != password){
      Mysnackbar.show(context!, 'Las constraseñas no coinciden.');
      return;
    }

    User user = new User(
      email: email,
      name: name,
      lastname: lastname,
      phone: phone,
      password: password
    );

    ResponseApi? response = await userProvider.create(user);
    String? text = response?.message;

    Mysnackbar.show(context!, text!);
  }
}