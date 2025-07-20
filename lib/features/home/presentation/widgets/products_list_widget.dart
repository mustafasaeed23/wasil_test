import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/assets.dart';
import 'package:store_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:store_app/features/home/presentation/cubit/products_state.dart';
import 'package:store_app/features/home/presentation/screens/product_details_screen.dart';
import 'package:store_app/features/home/presentation/widgets/product_card_widget.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Center(child: Lottie.asset(Assets.loadingLottie)),
          );
        }
        if (state is ProductsLoaded) {
          var productsList = state.productsList;
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return ProductCardWidget(
                productImage: productsList[index].thumbnail,
                productName: productsList[index].title,
                productDescription: productsList[index].description,
                productPrice: productsList[index].price.toString(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              ProductDetailsScreen(entity: productsList[index]),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: productsList.length,
          );
        } else if (state is ProductsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
      },
    );
  }
}
