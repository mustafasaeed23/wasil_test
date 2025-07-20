import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_texts.dart';

class CartQuantityWidget extends StatefulWidget {
  final ValueChanged<int> onQuantityChanged;

  const CartQuantityWidget({super.key, required this.onQuantityChanged});

  @override
  State<CartQuantityWidget> createState() => _CartQuantityWidgetState();
}

class _CartQuantityWidgetState extends State<CartQuantityWidget> {
  int quantity = 1;

  void _increment() {
    setState(() {
      quantity++;
    });
    widget.onQuantityChanged(quantity);
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
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
            child: Icon(Icons.add_circle, color: Colors.white),
          ),
          Text12(text: "$quantity"),
          GestureDetector(
            onTap: _decrement,
            child: Icon(Icons.remove_circle, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

