import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/authentication_padding.dart';
import '../cubit/authentication_cubit.dart';
import '../widgets/authentication_button.dart';
import '../widgets/authentication_formfield.dart';

@RoutePage()
class AuthenticationPage extends StatelessWidget with AuthenticationPadding {
  AuthenticationPage({
    Key? key,
  }) : super(key: key);

  final _welcome = "Askıda Uygulamasına Hoşgeldiniz!";
  final _emailLogin = "E-POSTA İLE GİRİŞ YAPIN ";
  final _email = "E-Posta";
  final _password = "Parola";
  final _enterance = "Giriş";
  final _or = "Veya";
  //final _googleConnect = "Google İle Bağlan";
  final _notSigned = "Kayıtlı Değilseniz. ";
  final _signUp = "KAYIT OL";
  late final AuthenticationCubit _loginCubit;

  void _initializeLoginCubit(BuildContext context) {
    _loginCubit = BlocProvider.of<AuthenticationCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    _initializeLoginCubit(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0), child: AppBar()),
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is LoginError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Error")));
          } else if (state is LoginSuccessfull) {
            state.userEntityModel.email;
          }
        },
        builder: (context, state) {
          if (state is LoginInitial) {
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
          AuthenticationFormField(
            labelText: _email,
            obscureText: false,
          ),
          AuthenticationFormField(
            labelText: _password,
            obscureText: true,
          ),
          AuthenticationButton(
            text: _enterance,
            color: Theme.of(context).primaryColor,
            onPressed: () async =>
                _loginCubit.logInWithEmail("email", "password"),
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
                  onPressed: () async =>
                      _loginCubit.registerWithEmail("email", "password"),
                  style: Theme.of(context).textButtonTheme.style,
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
