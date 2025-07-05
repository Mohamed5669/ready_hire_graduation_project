import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_hire/features/auth/presentation/authentication/test/quiz_app.dart';

class SimpleTestPage2 extends StatelessWidget {
  final String jobType;

  const SimpleTestPage2({required this.jobType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple Test',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
        ),
        backgroundColor: const Color.fromARGB(255, 250, 247, 247),
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', height: 150),
              SizedBox(height: 20.h),
              Text(
                '📌 instructions before starting the Assessments  :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),

              ), Text(
                '⚠️ please read the instructions carefully to ensure a smooth and fair Assessments experience:',
                style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),

              ),
              SizedBox(height: 20.h),
              Text(
                "1- you don't go out of the browser during the Assessments, this may automatically end the session \n2-  don't open new tabs or move to other sites, as this may exclude you from the test. \n3-  be careful to stabilize your Internet, because losing connectivity can result in losing your test progress. \n4-  allocate enough time to answer all the questions, as the pause or re-attempt cannot be put on hold immediately after the start. \n5-  choose a quiet, distraction-free place to ensure your focus during the solution.  \n6-  no external sources such as search engines or references are allowed to be used during the Assessments. \n7-  once the test starts, you won't be able to go back to previous questions, so make sure you answer before moving on to the next one.  \n8-  Take your time, focus well, show your best. We wish you all the best! 🎯",
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestScreen(jobType: jobType),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: REdgeInsets.symmetric(horizontal: 100),
                ),
                child: Text(
                  'Continue',

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
