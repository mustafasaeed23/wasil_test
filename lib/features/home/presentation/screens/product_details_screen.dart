import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/helpers/toast_manager.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/build_info_row.dart';
import 'package:store_app/core/widgets/carousel_slider_widget.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/core/widgets/under_line_text.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';
import 'package:store_app/features/cart/presentation/widgets/add_to_cart_with_price_widget.dart';
import 'package:store_app/features/cart/presentation/widgets/cart_quantity_widget.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';
import 'package:store_app/features/home/presentation/widgets/review_widget.dart';
import 'package:store_app/features/home/presentation/widgets/reviews_list_widget.dart';

// No changes in your imports

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.entity});
  final ProductEntity entity;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  void _onQuantityChanged(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    double originalPrice = widget.entity.price;
    double discount = widget.entity.discountPercentage;
    double discountedPrice = originalPrice - (originalPrice * discount / 100);
    double totalPrice = discountedPrice * quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text16(
          text: "Product Details",
          textColor: Colors.black,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyBoxOTP.withOpacity(0.5),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart, color: AppColors.purpleColor),
              onPressed: () => context.pushNamed(Routes.cartScreen),
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.purpleColor, size: 30),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSliderWidget(imageUrls: widget.entity.images),
            SizedBox(height: 20.h),

            // Product title and pricing
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text16(
                    text: widget.entity.title,
                    textColor: AppColors.purpleColor,
                    weight: FontWeight.w600,
                    maxLines: 2,
                    overFlow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text16(
                      text: "\$${discountedPrice.toStringAsFixed(2)}",
                      textColor: Colors.green,
                      weight: FontWeight.bold,
                    ),
                    Text14(
                      text: "\$${originalPrice.toStringAsFixed(2)}",
                      textColor: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                    Text12(
                      text: "-${discount.toStringAsFixed(0)}%",
                      textColor: AppColors.redColor,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 15.h),

            // Info Row with QR
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildInfoRow(
                        label: "Category",
                        value: widget.entity.category,
                      ),
                      BuildInfoRow(label: "Brand", value: widget.entity.brand),
                      BuildInfoRow(
                        label: "Stock",
                        value: widget.entity.stock.toString(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    imageUrl: widget.entity.meta.qrCode,
                    height: 70.w,
                    width: 70.w,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => const CircularProgressIndicator(),
                    errorWidget: (_, __, ___) => const Icon(Icons.error),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            // Rating and quantity
            Row(
              children: [
                RatingBarIndicator(
                  rating: widget.entity.rating,
                  itemBuilder:
                      (context, index) =>
                          Icon(Icons.star, color: AppColors.yellowColor),
                  itemCount: 5,
                  itemSize: 20,
                ),
                SizedBox(width: 6.w),
                Text14(
                  text: widget.entity.rating.toString(),
                  textColor: Colors.black,
                ),
                Spacer(),
                CartQuantityWidget(onQuantityChanged: _onQuantityChanged),
              ],
            ),

            SizedBox(height: 10.h),

            // Description
            Text16(
              text: "Description",
              textColor: Colors.black,
              weight: FontWeight.bold,
            ),
            SizedBox(height: 6.h),
            ReadMoreText(
              widget.entity.description,
              trimLines: 3,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Show more',
              trimExpandedText: ' Show less',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[800]),
              moreStyle: TextStyle(color: AppColors.purpleColor),
              lessStyle: TextStyle(color: AppColors.purpleColor),
            ),

            SizedBox(height: 16.h),

            // Reviews
            Text16(
              text: "Reviews",
              textColor: Colors.black,
              weight: FontWeight.bold,
            ),
            SizedBox(height: 6.h),
            ReviewslistWidget(widget: widget),

            SizedBox(height: 16.h),

            // More product info
            BuildInfoRow(
              label: "Warranty",
              value: widget.entity.warrantyInformation,
            ),
            BuildInfoRow(
              label: "Shipping Info",
              value: widget.entity.shippingInformation,
            ),
            BuildInfoRow(
              label: "Availability",
              value: widget.entity.availabilityStatus,
            ),
            BuildInfoRow(
              label: "Return Policy",
              value: widget.entity.returnPolicy,
            ),
            BuildInfoRow(
              label: "Min Order Qty",
              value: widget.entity.minimumOrderQuantity.toString(),
            ),

            SizedBox(height: 20.h),

            // Add to cart + price
            AddToCartWithPriceWidget(
              totalPrice: totalPrice,
              onPressed: () {
                context.read<CartCubit>().addToCart(product: widget.entity);
                ToastManager.showSuccessToast(
                  "Cart",
                  context,
                  "Item added to cart",
                  AppColors.lightGreenColor,
                );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
