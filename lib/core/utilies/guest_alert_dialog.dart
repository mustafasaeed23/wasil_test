import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_texts.dart';

Future<dynamic> guestAlertDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder:
        (_) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text12(text: "Guest Checkout", textColor: Colors.black),
          content: Text14(
            text: "Please create an account to proceed with checkout.",
            textColor: Colors.black,
          ),
          actionsPadding: EdgeInsets.only(
            bottom: 16.h,
            right: 16.w,
            left: 16.w,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Cancel",
                    onPressed: () => context.pop(),
                    color: AppColors.redColor,
                    fontWeight: FontWeight.w500,
                    height: 40.h,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomButton(
                    color: AppColors.purpleColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    text: "Create Account",
                    height: 40.h,
                    onPressed: () {
                      context.pop();
                      context.pushNamed(Routes.registerScreen);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
  );
}
