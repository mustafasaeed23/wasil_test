import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/theming/assets.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/utilies/guest_alert_dialog.dart';
import 'package:store_app/core/utilies/success_dialog.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/features/auth/bloc/auth_bloc.dart';
import 'package:store_app/features/auth/bloc/auth_state.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';
import 'package:store_app/features/cart/cubit/cart_state.dart';
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
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          final cartMap = cartCubit.cartMap;

          if (cartMap.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(Assets.cartEmptyLottie, height: 300.h),
                  SizedBox(height: 20.h),
                  Text16(
                    text: "Your cart is empty!",
                    textColor: Colors.grey,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            );
          }
          double totalPrice = cartMap.entries.fold(0.0, (sum, entry) {
            final product = entry.key;
            final quantity = entry.value;
            final price = product.price ?? 0;
            final discount = product.discountPercentage ?? 0;
            final discountedPrice = price - (price * discount / 100);
            return sum + (discountedPrice * quantity);
          });

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  child: SingleChildScrollView(child: CartListWidget()),
                ),
              ),
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
                    // Total price display
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text16(
                          text: "Total Price:",
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

                    // Checkout button
                    ElevatedButton(
                      onPressed: () {
                        final state = context.read<AuthBloc>().state;
                        final isGuest = state is AuthSuccess && state.isGuest;

                        if (isGuest) {
                          guestAlertDialog(context);
                        } else {
                          successDialog(context);
                        }
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
          );
        },
      ),
    );
  }
}
