import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/authentication/data/datasources/user_authentication_rest_data_source.dart';
import 'features/authentication/presentation/cubit/authentication_cubit.dart';

void main() {
  runApp(AskidaApp());
}

class AskidaApp extends StatelessWidget {
  AskidaApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthenticationCubit(UserAuthenticationRestDataSourceImpl()),
      child: MaterialApp.router(
        title: 'Askida',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().themeData,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
