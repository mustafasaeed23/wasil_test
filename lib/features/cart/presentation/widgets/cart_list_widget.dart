import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/core/theming/assets.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';
import 'package:store_app/features/cart/cubit/cart_state.dart';
import 'package:store_app/features/cart/presentation/widgets/cart_widget.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartUpdated && state.cartItems.isNotEmpty) {
          final cartItems = state.cartItems;

          return Center(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                final quantity = 1;

                return CartItemWidget(
                  product: product,
                  quantity: quantity,
                  onQuantityChanged: (newQuantity) {
                    context.read<CartCubit>().updateQuantity(
                      product,
                      newQuantity,
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 13.h),
              itemCount: cartItems.length,
            ),
          );
        }

        return SizedBox(
          height: 600.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(Assets.cartEmptyLottie),
                SizedBox(height: 10.h),
                Text14(text: "Cart is empty", textColor: Colors.black),
              ],
            ),
          ),
        );
      },
    );
  }
}
