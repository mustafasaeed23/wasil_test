import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/assets.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_text_form_field.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/features/auth/bloc/auth_bloc.dart';
import 'package:store_app/features/auth/bloc/auth_event.dart';
import 'package:store_app/features/auth/bloc/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            // Optionally show loading
          } else if (state is AuthSuccess) {
            context.pushNamed(Routes.homeScreen);
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Lottie.asset(Assets.registerLottie, height: 350.h)),
              SizedBox(height: 20.h),
              Text20(
                text: "Sign in",
                textColor: Colors.black,
                weight: FontWeight.w600,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: emailController,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                borderColor: Colors.black,
                hintText: "Email",
                borderRadius: BorderRadius.circular(10.r),
                backgroundColor: AppColors.greyBoxOTP.withOpacity(0.5),
                hintStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                textColor: Colors.black,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: passwordController,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                borderColor: Colors.black,
                hintText: "Password",
                obscureText: true,
                borderRadius: BorderRadius.circular(10.r),
                backgroundColor: AppColors.greyBoxOTP.withOpacity(0.5),
                hintStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                textColor: Colors.black,
              ),
              SizedBox(height: 40.h),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return CustomButton(
                    disabled: false,
                    fontSize: 14.r,
                    text: state is AuthLoading ? "Loading..." : "Continue",
                    borderRadius: 15.r,
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      if (email.isNotEmpty && password.isNotEmpty) {
                        context.read<AuthBloc>().add(
                          SignInEvent(email, password),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields"),
                          ),
                        );
                      }
                    },
                    fontWeight: FontWeight.w500,
                    height: 50.h,
                    color: AppColors.purpleColor,
                  );
                },
              ),
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.registerScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text12(
                      text: "Don't have an account ?",
                      textColor: Colors.black,
                    ),
                    SizedBox(width: 5.w),
                    Text12(
                      text: "Create Account",
                      textColor: AppColors.orangeColor,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
