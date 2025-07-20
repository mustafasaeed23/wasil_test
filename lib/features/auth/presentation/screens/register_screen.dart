import 'package:flutter/material.dart';
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
import 'package:store_app/core/widgets/or_separator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  // final GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.w),
        child: Form(
          // key: formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70.h),
                  Text20(
                    text: "Create Account",
                    textColor: Colors.black,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
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
                  CustomTextFormField(
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
                  CustomTextFormField(
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
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    borderColor: Colors.black,
                    hintText: "Password",
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
                  CustomButton(
                    text: "Sign Up",
                    color: AppColors.purpleColor,
                    height: 50.h,
                    fontSize: 15.r,
                    borderRadius: 15.r,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      context.pushNamed(Routes.homeScreen);
                    },
                  ),

                  SizedBox(height: 20.h),
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
                  OrSeparator(),

                  InkWell(
                    onTap: () {
                      context.pushNamed(Routes.loginScreen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text14(
                          text: "Have an account ?",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
