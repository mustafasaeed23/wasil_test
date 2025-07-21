import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/helpers/toast_manager.dart';
import 'package:store_app/core/theming/assets.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';
import 'package:store_app/features/cart/presentation/widgets/cart_quantity_widget.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

class CartItemWidget extends StatefulWidget {
  final ProductEntity product;
  final int quantity;
  final void Function(int) onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.product,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  void _onQuantityUpdated(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
    widget.onQuantityChanged(newQuantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Image.network(
                  widget.product.thumbnail,
                  width: 110.w,
                  height: 100.h,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text16(
                        text: widget.product.title,
                        textColor: Colors.black,
                        weight: FontWeight.w500,
                        maxLines: 1,
                      ),
                      SizedBox(height: 10.h),
                      Text16(
                        text: "\$${widget.product.price}",
                        textColor: Colors.green,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                child: InkWell(
                  onTap: () {
                    context.read<CartCubit>().removeFromCart(
                      product: widget.product,
                    );
                  },
                  child: SvgPicture.asset(Assets.deleteIcon),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10.h,
            right: 10.w,
            child: CartQuantityWidget(
              initialQuantity: widget.product.minimumOrderQuantity,
              onQuantityChanged: _onQuantityUpdated,
            ),
          ),
        ],
      ),
    );
  }
}
