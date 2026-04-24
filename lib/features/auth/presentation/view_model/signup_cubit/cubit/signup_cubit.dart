import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    emit(SignUpPasswordVisibilityChanged());
  }

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;

    emit(SignUpLoading());
    try {
      await authServices.value.createAccount(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      emit(SignUpSuccess());
    } on FirebaseException catch (e) {
      emit(SignUpFailure(e.message ?? 'There is an error'));
    } catch (e) {
      emit(SignUpFailure('Something went wrong'));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
