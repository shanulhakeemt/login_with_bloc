import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      try {
        final email = event.email;
        final password = event.password;

//^ Email validation using Regex

        if (password.length < 6) {
          return emit(AuthFailure("password cannot be less than 6 characters"));
        }

        await Future.delayed(
          const Duration(seconds: 1),
          () {
            return emit(AuthSuccess(uid: "$email-$password"));
          },
        );
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
  }
}
