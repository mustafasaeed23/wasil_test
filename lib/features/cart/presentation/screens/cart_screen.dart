import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_texts.dart';

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
    );
  }
}
