import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/features/cart/presentation/widgets/cart_list_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text16(
          text: "Cart",
          textColor: Colors.black,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.purpleColor, size: 30),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Column(
        children: [
          // Cart items - scrollable
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: SingleChildScrollView(child: CartListWidget()),
            ),
          ),

          // Bottom fixed section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text16(
                      text: "Total Price :",
                      textColor: Colors.grey.shade600,
                      weight: FontWeight.bold,
                    ),
                    Text16(
                      text: "\$109",
                      textColor: Colors.black,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),

                // Checkout button
                ElevatedButton(
                  onPressed: () {
                    // handle checkout
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purpleColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.forward, color: Colors.white),
                      SizedBox(width: 10.w),
                      Text16(
                        text: "CheckOut",
                        textColor: Colors.white,
                        weight: FontWeight.w600,
                      ),
                    ],
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
