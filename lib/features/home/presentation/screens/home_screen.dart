import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_drop_down.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/features/home/presentation/widgets/products_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedValue1;
  String? selectedValue2;

  final List<String> sortingoptions = ['category', 'brnad', 'price'];
  final List<String> filteringoptions = ['category', 'brnad', 'price'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text18(text: "Products", textColor: Colors.black),
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyBoxOTP.withOpacity(0.5),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, color: AppColors.purpleColor),
              onPressed: () {
                context.pushNamed(Routes.cartScreen);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: CustomDropDown(
                    height: 40.h,
                    dropdownValue: selectedValue1,
                    options: filteringoptions,
                    hintText: "filtering by..",
                    onChanged: (value) => setState(() => selectedValue1 = value),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomDropDown(
                    height: 40.h,
                    dropdownValue: selectedValue2,
                    options: sortingoptions,
                    hintText: "sorting by..",
                    onChanged: (value) => setState(() => selectedValue2 = value),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(child: SingleChildScrollView(child: ProductsListWidget())),
          ],
        ),
      ),
    );
  }
}
