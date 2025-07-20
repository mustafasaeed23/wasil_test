import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/helpers/toast_manager.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_text_form_field.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/core/widgets/or_separator.dart';
import 'package:store_app/features/auth/bloc/auth_bloc.dart';
import 'package:store_app/features/auth/bloc/auth_event.dart';
import 'package:store_app/features/auth/bloc/auth_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: Form(
          key: _formKey,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                ToastManager.showSuccessToast(
                  "Sign Up",
                  context,
                  "Account Created Succssfuly",
                );

                context.pushReplacementNamed(Routes.homeScreen);
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    Center(
                      child: Text20(
                        text: "Create Account",
                        textColor: Colors.black,
                        weight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 40.h),

                    /// First Name
                    CustomTextFormField(
                      controller: _firstNameCtrl,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      borderColor: Colors.black,
                      hintText: "First Name",
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

                    /// Last Name
                    CustomTextFormField(
                      controller: _lastNameCtrl,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      borderColor: Colors.black,
                      hintText: "Last Name",
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

                    /// Email
                    CustomTextFormField(
                      controller: _emailCtrl,
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
                      keyboardType: TextInputType.emailAddress,
                    ),

                    SizedBox(height: 20.h),

                    /// Password
                    CustomTextFormField(
                      controller: _passwordCtrl,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      borderColor: Colors.black,
                      hintText: "Password",
                      obscureText: !_isPasswordVisible,
                      borderRadius: BorderRadius.circular(10.r),
                      backgroundColor: AppColors.greyBoxOTP.withOpacity(0.5),
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textColor: Colors.black,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 40.h),

                    /// Sign Up Button
                    state is AuthLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomButton(
                          text: "Sign Up",
                          color: AppColors.purpleColor,
                          height: 50.h,
                          fontSize: 15.r,
                          borderRadius: 15.r,
                          fontWeight: FontWeight.w500,
                          onPressed: () {
                            // Simple validation
                            if (_emailCtrl.text.isNotEmpty &&
                                _passwordCtrl.text.isNotEmpty &&
                                _firstNameCtrl.text.isNotEmpty &&
                                _lastNameCtrl.text.isNotEmpty) {
                              context.read<AuthBloc>().add(
                                SignUpEvent(
                                  _firstNameCtrl.text.trim(),
                                  _lastNameCtrl.text.trim(),
                                  _emailCtrl.text.trim(),
                                  _passwordCtrl.text,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("All fields required"),
                                ),
                              );
                            }
                          },
                        ),

                    SizedBox(height: 20.h),

                    /// Continue as Guest
                    CustomButton(
                      text: "Continue as a guest",
                      color: AppColors.orangeColor,
                      height: 50.h,
                      fontSize: 15.r,
                      borderRadius: 15.r,
                      fontWeight: FontWeight.w500,
                      onPressed: () {
                        context.pushNamed(Routes.homeScreen);
                      },
                    ),

                    SizedBox(height: 20.h),
                    OrSeparator(),

                    /// Login Link
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.loginScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text14(
                            text: "Have an account?",
                            textColor: Colors.black,
                          ),
                          SizedBox(width: 5.w),
                          Text14(
                            text: "Log In",
                            textColor: AppColors.purpleColor,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
