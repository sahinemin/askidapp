import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/datasources/user_authentication_rest_data_source.dart';
import '../../data/models/user_entity_model.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  UserAuthenticationRestDataSource userAuthenticationRestDataSource;
  AuthenticationCubit(this.userAuthenticationRestDataSource)
      : super(const LoginInitial());

  Future<void> logInWithEmail(String email, String password) async {
    // Add state to indicate that the login is in progress.
    emit(const LoginLoading());
    try {
      // Perform the actual login process here, e.g. call an API endpoint.
      UserEntityModel model = await userAuthenticationRestDataSource
          .signInWithEmail(email, password); // Simulate a network delay.

      // If the login was successful, emit the success state.
      emit(LoginSuccessfull(model));
    } catch (e) {
      // If an error occurred during the login process, emit the error state.
      emit(const LoginError());
    }
  }

  Future<void> registerWithEmail(String email, String password) async {
    // Add state to indicate that the login is in progress.
    emit(const LoginLoading());
    try {
      // Perform the actual login process here, e.g. call an API endpoint.
      userAuthenticationRestDataSource.signUpWithEmail(
          email, password); // Simulate a network delay.
      UserEntityModel model = await userAuthenticationRestDataSource
          .signInWithEmail(email, password);
      // If the login was successful, emit the success state.
      emit(LoginSuccessfull(model));
    } catch (e) {
      // If an error occurred during the login process, emit the error state.
      emit(const LoginError());
    }
  }
/*
  Future<void> signInWithGoogle(String email, String password) async {
    // Add state to indicate that the login is in progress.
    emit(const LoginLoading());
    try {
      // Perform the actual login process here, e.g. call an API endpoint.
      await Future.delayed(
          const Duration(seconds: 2)); // Simulate a network delay.

      // If the login was successful, emit the success state.
      emit(LoginSuccessfull());
    } catch (e) {
      // If an error occurred during the login process, emit the error state.
      emit(const LoginError());
    }
  }*/
}
