import 'package:askidapp/core/error/failure_map.dart';
import 'package:askidapp/core/usecases/usecase.dart';
import 'package:askidapp/features/authentication/domain/entities/user_entity.dart';
import 'package:askidapp/features/authentication/domain/usecases/sign_in_from_rest.dart';
import 'package:askidapp/features/authentication/domain/usecases/sign_up_from_rest.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this.signInFromRest, this.signUpFromRest)
      : super(
          const LoginInitial(),
        );
  final SignInFromRest signInFromRest;
  final SignUpFromRest signUpFromRest;

  Future<void> logInWithEmail(String email, String password) async {
    emit(const LoginLoading());
    final failureOrToken = await signInFromRest(
      Params(email, password),
    );
    failureOrToken.fold(
      (failure) => emit(
        LoginError(FailureMap().mapFailureToMessage(failure)),
      ),
      (userEntity) => emit(
        LoginSuccessfull(UserEntity(email: email, password: password)),
      ),
    );
  }

  Future<void> registerWithEmail(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    emit(const LoginLoading());
    final failureOrToken = await signUpFromRest(
      ParamsForRegister(
        firstName,
        lastName,
        email,
        password,
      ),
    );
    failureOrToken.fold(
      (failure) => emit(
        LoginError(FailureMap().mapFailureToMessage(failure)),
      ),
      (userEntity) => emit(
        RegistrationSuccessfull(UserEntity(email: email, password: password)),
      ),
    );
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
