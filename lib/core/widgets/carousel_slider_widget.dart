import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/theming/colors.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<String> imageUrls;

  const CarouselSliderWidget({super.key, required this.imageUrls});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.purpleColor),
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items:
                widget.imageUrls.map((imageUrl) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fitHeight,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                }).toList(),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                widget.imageUrls.asMap().entries.map((entry) {
                  return Container(
                    width: _currentIndex == entry.key ? 10.w : 6.w,
                    height: _currentIndex == entry.key ? 10.h : 6.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == entry.key
                              ? AppColors.purpleColor
                              : Colors.black,
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
