import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/toast_manager.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';

class AddToCartWithPriceWidget extends StatelessWidget {
  final double totalPrice;
  final void Function()? onPressed;

  const AddToCartWithPriceWidget({super.key, required this.totalPrice, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text16(
              text: "Total Price :",
              textColor: Colors.grey.shade600,
              weight: FontWeight.bold,
            ),
            Text16(
              text: "\$${totalPrice.toStringAsFixed(2)}",
              textColor: Colors.black,
              weight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(width: 20.w),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.purpleColor,
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.shopping_cart_checkout_outlined, color: Colors.white),
              SizedBox(width: 15.w),
              Text16(
                text: "Add to Cart",
                textColor: Colors.white,
                weight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
