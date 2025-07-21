import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/helpers/extensions.dart';
import 'package:store_app/core/theming/colors.dart';
import 'package:store_app/core/widgets/custom_texts.dart';
import 'package:store_app/features/home/domain/entities/product_entity.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.reviewerName,
    required this.reviewerEmail,
    required this.reviewerComment,
    required this.rating,
    required this.reviewrDate,
  });
  final String reviewerName;
  final String reviewerEmail;
  final String reviewerComment;
  final int rating;
  final DateTime reviewrDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),

      width: 327.w,
      // height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.orangeColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text14(text: reviewerName, textColor: Colors.black),
          SizedBox(height: 5.h),
          Text12(text: reviewerEmail, textColor: Colors.grey.shade500),
          SizedBox(height: 10.h),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text12(
                  text: reviewerComment,
                  textColor: AppColors.purpleColor,
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 8.h),
                RatingBarIndicator(
                  rating: rating.toDouble(),
                  itemBuilder:
                      (context, index) =>
                          Icon(Icons.star, color: AppColors.yellowColor),
                  itemCount: 5,
                  itemSize: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.bottomRight,
            child: Text12(
              text: reviewrDate.toCustomFormat(),
              textColor: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
