import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/theming/assets.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/features/cart/presentation/widgets/cart_quantity_widget.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({super.key});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int quantity = 1;

  void _onQuantityChanged(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.purpleColor),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  Assets.productCartImage,
                  width: 110.w,
                  height: 100.h,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 15.w),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text16(
                      text: "product Name",
                      textColor: Colors.black,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(height: 10.h),
                    Text16(
                      text: "\$99",
                      textColor: Colors.green,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                child: SvgPicture.asset(
                  Assets.deleteIcon,
                  color: AppColors.redColor,
                ),
              ),
            ],
          ),

          // Bottom right quantity widget
          Positioned(
            bottom: 10.h,
            right: 10.w,
            child: CartQuantityWidget(onQuantityChanged: _onQuantityChanged),
          ),
        ],
      ),
    );
  }
}
