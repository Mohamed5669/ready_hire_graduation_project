import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/colors_manager.dart';

class ThemeManager {

  static final ThemeData light = ThemeData(
      scaffoldBackgroundColor: ColorsManager.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: Colors.grey,
        prefixIconColor: Colors.grey,
        labelStyle: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 16.sp,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
      textButtonTheme: TextButtonThemeData(

          style: TextButton.styleFrom(

              padding: EdgeInsets.zero,
              foregroundColor: Colors.blue,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r)),
              backgroundColor: Colors.blue,
              foregroundColor: ColorsManager.white,
              textStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorsManager.white))),
      textTheme: TextTheme(

        bodySmall: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
        titleMedium: TextStyle(
            color: ColorsManager.grey,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400),
      )
  );
}
