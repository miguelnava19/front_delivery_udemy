import 'package:flutter/material.dart';

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController nombreController = new TextEditingController();
  TextEditingController apellidoController = new TextEditingController();
  TextEditingController telefonoController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordConfirmController = new TextEditingController();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToLogin() {
    Navigator.pushNamed(context!, 'login');
  }

  void register(){
    String email = emailController.text.trim();
    String nombre = nombreController.text;
    String apellido = apellidoController.text;
    String telefono = telefonoController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();
  }
}