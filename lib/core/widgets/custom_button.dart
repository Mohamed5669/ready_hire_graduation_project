import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.imagePath});

  final VoidCallback onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Image.asset(imagePath, height: 10.h, width: 10.w),
      ),
    );
  }
}
