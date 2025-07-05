import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_hire/core/resources/constant_manager.dart';
import 'package:ready_hire/core/resources/controllers.dart';

import '../../model/job_card_model.dart';

class BuildPage1 extends StatelessWidget {
  final String? imagePath;
  final String? title;

  const BuildPage1({super.key, this.imagePath, this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagePath != null
              ? Image.asset(imagePath!, height: 200.h)
              : Container(),
          SizedBox(height: 20.h),
          Text(
            title ?? 'Welcome',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20.h),
          Padding(
            padding: REdgeInsets.only(left: 13),
            child: SizedBox(
              height: 240.h,
              child: ListView.builder(
                controller: Controllers.scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: ConstantsManager.employees.length,
                itemBuilder: (context, index) {
                  final job = ConstantsManager.employees[index];
                  return SizedBox(
                    width: 330.w,
                    child: JobCardModel1(
                      image: job['Image']!,
                      name: job['Name']!,
                      jobTitle: job['jobTitle']!,
                      location: job['location']!,
                      description: job['description']!,
                      jobType: job['jobType']!,
                      workMode: "Onsite",
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
