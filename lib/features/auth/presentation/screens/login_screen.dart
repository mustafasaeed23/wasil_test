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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              disabled: false,
              fontSize: 14.r,
              text: "continue",
              borderRadius: 15.r,
              onPressed: () {
                context.pushNamed(Routes.homeScreen);
              },
              fontWeight: FontWeight.w500,
              height: 50.h,
              color: AppColors.purpleColor,
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
    );
  }
}
