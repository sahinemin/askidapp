import 'package:askidapp/features/authentication/presentation/widgets/authentication_formfield.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    required this.paddingValue,
    required String email,
    required this.emailController,
    required String password,
    required this.passwordController,
    super.key,
  })  : _email = email,
        _password = password;

  final EdgeInsets paddingValue;
  final String _email;
  final TextEditingController emailController;
  final String _password;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: paddingValue,
            child: AuthenticationFormField(
              inputType: TextInputType.emailAddress,
              labelText: _email,
              textController: emailController,
            ),
          ),
          Padding(
            padding: paddingValue,
            child: AuthenticationFormField(
              inputType: TextInputType.visiblePassword,
              labelText: _password,
              isObscureText: true,
              textController: passwordController,
              action: TextInputAction.done,
            ),
          ),
        ],
      ),
    );
  }
}
