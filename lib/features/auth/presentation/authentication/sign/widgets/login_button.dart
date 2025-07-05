import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color textColor;
  final Color borderColor;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
        minimumSize: const Size(350, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 24.w, height: 24.h),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
