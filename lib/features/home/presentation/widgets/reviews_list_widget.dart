import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/features/home/presentation/screens/product_details_screen.dart';
import 'package:store_app/features/home/presentation/widgets/review_widget.dart';

class ReviewslistWidget extends StatelessWidget {
  const ReviewslistWidget({super.key, required this.widget});

  final ProductDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h, // Set appropriate height for horizontal list
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.entity.reviews.length,
        itemBuilder: (context, index) {
          final review = widget.entity.reviews[index];
          return ReviewWidget(
            reviewerName: review.reviewerName,
            reviewerEmail: review.reviewerEmail,
            reviewerComment: review.comment,
            rating: review.rating,
            reviewrDate: review.date,
          );
        },
        separatorBuilder:
            (context, index) =>
                SizedBox(width: 12.w), // use width instead of height
      ),
    );
  }
}
