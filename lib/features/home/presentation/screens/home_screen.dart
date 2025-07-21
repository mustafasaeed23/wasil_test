import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_drop_down.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:store_app/features/home/presentation/cubit/products_state.dart';
import 'package:store_app/features/home/presentation/widgets/products_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> sortingOptions = ['category', 'brand', 'price'];
  final List<String> filteringOptions = ['category', 'brand', 'price'];

  String? selectedSorting;
  String? selectedFilter;

  late final User? currentUser;
  late final bool isGuest;

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    isGuest = currentUser == null || currentUser!.isAnonymous;

    // Load products initially
    context.read<ProductsCubit>().getAllProducts();
  }

  void _onFilterOrSortChanged() {
    context.read<ProductsCubit>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text18(text: "Products", textColor: Colors.black),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.greyBoxOTP.withOpacity(0.5),
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart, color: AppColors.purpleColor),
                onPressed: () => context.pushNamed(Routes.cartScreen),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            if (!isGuest) ...[
              Text18(
                text:
                    "Welcome, ${currentUser?.displayName ?? currentUser?.email ?? "User"} 👋",
                textColor: AppColors.purpleColor,
                weight: FontWeight.bold,
              ),
              SizedBox(height: 10.h),
            ],
            Row(
              children: [
                Expanded(
                  child: CustomDropDown(
                    height: 40.h,
                    dropdownValue: selectedFilter,
                    options: filteringOptions,
                    hintText: "Filtering by...",
                    onChanged: (value) {
                      setState(() {
                        selectedFilter = value;
                      });
                      _onFilterOrSortChanged();
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CustomDropDown(
                    height: 40.h,
                    dropdownValue: selectedSorting,
                    options: sortingOptions,
                    hintText: "Sorting by...",
                    onChanged: (value) {
                      setState(() {
                        selectedSorting = value;
                      });
                      _onFilterOrSortChanged();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductsError) {
                    return Center(child: Text(state.message));
                  } else if (state is ProductsLoaded) {
                    return ProductsListWidget();
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
