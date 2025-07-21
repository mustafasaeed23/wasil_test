import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/theming/assets.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_texts.dart';

Future<void> successDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text14(text: "Success", textColor: Colors.black),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                Assets.successLottie,
                height: 100.h,
                repeat: false,
              ),
              SizedBox(height: 16.h),
              Text16(
                text: "Your checkout was successful.",
                textColor: Colors.black,
                weight: FontWeight.w500,
                alignment: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text12(
              text: "OK",
              textColor: AppColors.purpleColor,
              weight: FontWeight.bold,
            ),
          ),
        ],
      );
    },
  );
}
