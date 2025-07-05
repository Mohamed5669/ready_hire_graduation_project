import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobCardModel2 extends StatelessWidget {
  final String companyImage;
  final String companyName;
  final String jobTitle;
  final String location;
  final String salary;
  final String jobType;
  final String workMode;

  const JobCardModel2({
    super.key,
    required this.companyImage,
    required this.companyName,
    required this.jobTitle,
    required this.location,
    required this.salary,
    required this.jobType,
    required this.workMode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                CircleAvatar(
                  backgroundImage: AssetImage(companyImage),
                  radius: 25.r,
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobTitle,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        companyName,
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
                    salary,
                    style: TextStyle(fontSize: 14, color: Colors.blue[600]),
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
                  label: Text(workMode),
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
