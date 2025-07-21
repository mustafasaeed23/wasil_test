import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_texts.dart';

class CartQuantityWidget extends StatefulWidget {
  final ValueChanged<int> onQuantityChanged;
  final int initialQuantity;

  const CartQuantityWidget({
    super.key,
    required this.onQuantityChanged,
    this.initialQuantity = 1,
  });

  @override
  State<CartQuantityWidget> createState() => _CartQuantityWidgetState();
}

class _CartQuantityWidgetState extends State<CartQuantityWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void _increment() {
    setState(() => quantity++);
    widget.onQuantityChanged(quantity);
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() => quantity--);
      widget.onQuantityChanged(quantity);
    }
  }

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
          GestureDetector(
            onTap: _increment,
            child: const Icon(Icons.add_circle, color: Colors.white),
          ),
          Text12(
            text: "$quantity",
            textColor: Colors.white,
            weight: FontWeight.bold,
          ),
          GestureDetector(
            onTap: _decrement,
            child: const Icon(Icons.remove_circle, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
