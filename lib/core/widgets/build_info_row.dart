import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/widgets/custom_texts.dart';

class BuildInfoRow extends StatelessWidget {
  final String label;
  final String? value;
  final Widget? valueWidget;

  const BuildInfoRow({
    super.key,
    required this.label,
    this.value,
    this.valueWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text14(
            text: "$label: ",
            textColor: Colors.black,
            weight: FontWeight.w600,
          ),
          Expanded(
            child:
                valueWidget ??
                Text14(text: value ?? "", textColor: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}