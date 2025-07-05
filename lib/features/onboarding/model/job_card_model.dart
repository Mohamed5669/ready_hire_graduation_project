import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobCardModel1 extends StatelessWidget {
  final String image;
  final String name;
  final String jobTitle;
  final String location;
  final String description;
  final String jobType;
  final String? workMode;

  const JobCardModel1({
    super.key,
    required this.image,
    required this.name,
    required this.jobTitle,
    required this.location,
    required this.description,
    required this.jobType,
    this.workMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        padding: REdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 0.2.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(backgroundImage: AssetImage(image), radius: 25.r),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        jobTitle,
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.bookmark_border, color: Colors.blue),
              ],
            ),
            const Divider(),
            Padding(
              padding: REdgeInsets.only(left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    location,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14.sp, color: Colors.blue[600]),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            Row(
              children: [
                Chip(
                  label: Text(jobType),
                  backgroundColor: Colors.white,
                  labelStyle: const TextStyle(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  side: const BorderSide(color: Colors.grey),
                ),
                const Spacer(),
                Chip(
                  label: Text(workMode!),
                  backgroundColor: Colors.white,
                  labelStyle: const TextStyle(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  side: const BorderSide(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
