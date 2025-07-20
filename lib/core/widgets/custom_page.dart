import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/widgets/back.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/core/widgets/finding_button.dart';


class CustomPage extends StatelessWidget {
  final String assetImage;
  final String title;
  final String description;
  final Color backgroundColor;
  final Color textColor;
  final bool hasButton;
  final bool hasBackButton;
  final String buttonText;
  final Alignment imageAlignment;
  final VoidCallback onPressed;
  const CustomPage({
    this.imageAlignment = Alignment.bottomCenter,
    super.key,
    this.hasButton = true,
    this.hasBackButton = true,
    required this.backgroundColor,
    required this.assetImage,
    this.textColor = Colors.white,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        leading: hasBackButton
            ? Back(
                iconColor: textColor,
              )
            : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              Container(
                alignment: imageAlignment,
                height: 500.h,
                child: Image.asset(assetImage),
              ),
              20.height,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text28(
                      text: title,
                      size: 30.r,
                      weight: FontWeight.w700,
                      spacing: 0,
                      textColor: textColor,
                      alignment: TextAlign.center,
                    ),
                    10.height,
                    Text18(
                      text: description,
                      textColor: textColor,
                      weight: FontWeight.w400,
                      alignment: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: hasButton
          ? IntrinsicHeight(
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(left: 50.w, right: 50.w, bottom: 30.h),
                  child: FindingButton(
                    disabled: false,
                    // borderRadius: 15.r,
                    // height: 50.h,
                    text: buttonText,
                    onPressed: onPressed,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
