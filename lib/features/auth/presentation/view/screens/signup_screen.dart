// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:fitness_app/features/auth/presentation/view_model/signup_cubit/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(),
      child: const _SignUpView(),
    );
  }
}

class _SignUpView extends StatelessWidget {
  const _SignUpView();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();

    const backgroundColor = Color(0xFF0F172A);
    const cardColor = Color(0xFF1E293B);
    const accentBlue = Color(0xFF1D4ED8);
    const secondaryTextColor = Color(0xFF94A3B8);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: BlocConsumer<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Processing Data..., Sign in is done'),
                    backgroundColor: Colors.green,
                  ),
                );

                context.pop();
              }

              if (state is SignUpFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // قسم الصورة (نفس التصميم السابق)
                  _buildHeroSection(backgroundColor),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // حقل الاسم الكامل
                        _buildLabel("Full Name"),
                        TextFormField(
                          controller: cubit.nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration(
                            "Enter your name",
                            cardColor,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter your name';
                            return null;
                          },
                        ),

                        const SizedBox(height: 15),

                        // حقل البريد الإلكتروني
                        _buildLabel("Email Address"),
                        TextFormField(
                          controller: cubit.emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration(
                            "Enter your email",
                            cardColor,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter email';

                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                              return 'Enter a valid email';

                            return null;
                          },
                        ),

                        const SizedBox(height: 15),

                        // حقل كلمة المرور
                        _buildLabel("Password"),
                        TextFormField(
                          controller: cubit.passwordController,
                          obscureText: cubit.obscurePassword,
                          style: const TextStyle(color: Colors.white),
                          decoration:
                              _inputDecoration(
                                "Create a password",
                                cardColor,
                              ).copyWith(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    cubit.obscurePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off,
                                    color: secondaryTextColor,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<SignupCubit>()
                                        .togglePasswordVisibility();
                                  },
                                ),
                              ),
                          validator: (value) {
                            if (value == null || value.length < 6)
                              return 'Password must be at least 6 characters';
                            return null;
                          },
                        ),

                        const SizedBox(height: 30),

                        // زر إنشاء الحساب مع Loading
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: state is SignUpLoading
                                ? null
                                : () {
                                    context.read<SignupCubit>().signUp();
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: accentBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: state is SignUpLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'Create Account',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),

                        // الفوتر كما هو
                        _buildFooter(secondaryTextColor, cardColor),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // --- دوال مساعدة للتنسيق ---

  Widget _buildLabel(String label) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, Color fillColor) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
      filled: true,
      fillColor: fillColor,
      errorStyle: const TextStyle(color: Colors.redAccent),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    );
  }

  Widget _buildHeroSection(Color bgColor) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 350,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=600',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 220,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, bgColor],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Join the Forge',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Start your transformation journey today.',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(Color secondaryTextColor, Color cardColor) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        Text(
          "Already have an account? Log in",
          style: TextStyle(color: secondaryTextColor),
        ),
      ],
    );
  }
}
