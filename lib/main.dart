import 'package:askidapp/config/router/router.dart';
import 'package:askidapp/config/theme/theme.dart';
import 'package:askidapp/core/constants/constants.dart';
import 'package:askidapp/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:askidapp/injection_container.dart' as di;
import 'package:askidapp/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthenticationCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: AppConstants.appName,
        theme: AppTheme().getLightTheme,
        darkTheme: AppTheme().getDarkTheme,
        routerConfig: AppRouter.routes,
      ),
    );
  }
}
