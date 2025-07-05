import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import 'SimpleTestPage2.dart';

class SimpleTestPage extends StatefulWidget {
  const SimpleTestPage({super.key});

  @override
  _SimpleTestPageState createState() => _SimpleTestPageState();
}

class _SimpleTestPageState extends State<SimpleTestPage> {
  String? _selectedJobType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Test',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),),
        backgroundColor: const Color.fromARGB(255, 250, 247, 247),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(ImageAssets.second, height: 180.h),
            ),
            SizedBox(height: 15.h),
            Text(
              'Now we’re going to do some\n simple questions in order to hire\n you faster.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '    Choose your Job Type:',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.h),
            _buildRadioOption('Software Engineer'),
            _buildRadioOption('Graphic Designer'),
            _buildRadioOption('Frontend Developer'),
            _buildRadioOption('Backend Developer'),
            _buildRadioOption('Network Engineer'),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {
                if (_selectedJobType != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SimpleTestPage2(jobType: _selectedJobType!),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a job type')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: REdgeInsets.symmetric(horizontal: 100),
              ),
              child: Text(
                'Continue',
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(String jobType) {
    return RadioListTile<String>(
      title: Text(jobType),
      value: jobType,
      groupValue: _selectedJobType,
      activeColor: Colors.blue,
      onChanged: (value) {
        setState(() {
          _selectedJobType = value!;
        });
      },
    );
  }
}
