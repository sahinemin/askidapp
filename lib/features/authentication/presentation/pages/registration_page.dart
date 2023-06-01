import 'package:askidapp/core/constants/authentication_padding.dart';
import 'package:askidapp/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:askidapp/features/authentication/presentation/widgets/authentication_button.dart';
import 'package:askidapp/features/authentication/presentation/widgets/authentication_formfield.dart';
import 'package:askidapp/features/authentication/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegistrationPage extends StatelessWidget with AuthenticationPadding {
  RegistrationPage({super.key});

  final _firstName = 'İsim';

  final _lastName = 'Soyisim';

  final _email = 'E-Posta';

  final _password = 'Parola';

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  late final AuthenticationCubit _registerCubit;

  @override
  Widget build(BuildContext context) {
    _registerCubit = BlocProvider.of<AuthenticationCubit>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is RegistrationSuccessfull) {
            context.go('/home');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: bodyPadding,
              child: Column(
                children: [
                  const Icon(
                    Icons.person_add,
                    size: 72,
                  ),
                  AuthenticationFormField(
                    inputType: TextInputType.name,
                    labelText: _firstName,
                    textController: firstNameController,
                    denySpace: false,
                  ),
                  AuthenticationFormField(
                    inputType: TextInputType.name,
                    labelText: _lastName,
                    textController: lastNameController,
                    denySpace: false,
                  ),
                  LoginForm(
                    paddingValue: paddingValue,
                    email: _email,
                    emailController: emailController,
                    password: _password,
                    passwordController: passwordController,
                  ),
                  AuthenticationButton(
                    text: 'text',
                    onPressed: () => _registerCubit.registerWithEmail(
                      emailController.text,
                      passwordController.text,
                      firstNameController.text,
                      lastNameController.text,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
