import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_texts.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    this.onPressed,
  });
  final String productImage;
  final String productName;
  final String productDescription;
  final String productPrice;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.greyBoxOTP),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 3,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: NetworkImage(productImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text14(
                  text: productName,
                  textColor: Colors.black,
                  weight: FontWeight.w600,
                  maxLines: 1,
                ),
                SizedBox(height: 5.h),
                Text12(
                  text: productDescription,
                  textColor: Colors.black,
                  weight: FontWeight.w500,
                  maxLines: 2,
                  overFlow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Text14(
                  text: "\$$productPrice",
                  textColor: const Color.fromARGB(255, 25, 165, 30),
                  weight: FontWeight.w600,
                ),
                const Spacer(),

                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomButton(
                    color: AppColors.darkOrangeColor,
                    text: "see details",
                    onPressed: onPressed,
                    height: 30.h,
                    fontSize: 12.sp,

                    width: 100,
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomButton(
                    text: "Add to cart",
                    onPressed: () {},
                    height: 40.h,
                    fontSize: 14.sp,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
