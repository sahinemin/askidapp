import 'package:askidapp/core/constants/authentication_padding.dart';
import 'package:askidapp/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:askidapp/features/authentication/presentation/widgets/authentication_button.dart';
import 'package:askidapp/features/authentication/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthenticationPage extends StatelessWidget with AuthenticationPadding {
  AuthenticationPage({
    super.key,
  });

  final _welcome = 'Askıda Uygulamasına Hoşgeldiniz!';

  final _emailLogin = 'E-POSTA İLE GİRİŞ YAPIN ';

  final _email = 'E-Posta';

  final _password = 'Parola';

  final _enterance = 'Giriş';

  final _or = 'Veya';

  //final _googleConnect = "Google İle Bağlan";
  final _notSigned = 'Kayıtlı Değilseniz. ';

  final _signUp = 'KAYIT OL';

  late final AuthenticationCubit _loginCubit;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _loginCubit = BlocProvider.of<AuthenticationCubit>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is LoginError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is LoginSuccessfull) {
            context.go('/home', extra: state.userEntity);
          }
        },
        builder: (context, state) {
          if (state is LoginInitial) {
            return buildInitial(context);
          } else if (state is LoginError) {
            return buildInitial(context);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  SingleChildScrollView buildInitial(BuildContext context) {
    return SingleChildScrollView(
      padding: bodyPadding,
      child: Column(
        children: <Widget>[
          Text(
            _welcome,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(
            padding: paddingValue,
            child: Text(
              _emailLogin,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          LoginForm(
            paddingValue: paddingValue,
            email: _email,
            emailController: emailController,
            password: _password,
            passwordController: passwordController,
          ),
          AuthenticationButton(
            text: _enterance,
            onPressed: () async => _loginCubit.logInWithEmail(
              emailController.text,
              passwordController.text,
            ),
          ),
          Padding(
            padding: paddingValue,
            child: Center(child: Text(_or)),
          ),
          /*
          AuthenticationButton(
            text: _googleConnect,
            color: Colors.red,
            onPressed: () async =>
                _loginCubit.signInWithGoogle("email", "password"),
          ),
          */
          Padding(
            padding: paddingValue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_notSigned),
                TextButton(
                  onPressed: () => context.push('/register'),
                  child: Text(_signUp),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
