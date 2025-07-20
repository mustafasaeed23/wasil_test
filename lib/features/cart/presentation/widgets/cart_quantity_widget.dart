import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_texts.dart';

class CartQuantityWidget extends StatelessWidget {
  const CartQuantityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: AppColors.purpleColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.add_circle, color: Colors.white),
          Text12(text: "1"),
          Icon(Icons.remove_circle, color: Colors.white),
        ],
      ),
    );
  }
}