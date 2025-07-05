import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/routes_manager/routes_manager.dart';

class SelectJobTypePage extends StatefulWidget {
  const SelectJobTypePage({super.key});

  @override
  _SelectJobTypePageState createState() => _SelectJobTypePageState();
}

class _SelectJobTypePageState extends State<SelectJobTypePage> {
  bool isFindJobSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Select Job Type',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(ImageAssets.logo),

              Text(
                "Choose what do you want",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Text(
                "Choose whether you are looking\n for a job or a company needs employee",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFindJobSelected = true;
                      });
                    },
                    child: OptionCard(
                      icon: Icons.work_outline,
                      label: "Find a Job",
                      isSelected: isFindJobSelected,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFindJobSelected = false;
                      });
                    },
                    child: OptionCard(
                      icon: Icons.person_outline,
                      label: "Find an Employee",
                      isSelected: !isFindJobSelected,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  if (isFindJobSelected) {
                    Navigator.pushNamed(
                        context, RoutesManager.signUpAsEmployee);
                  } else {
                    Navigator.pushNamed(context, RoutesManager.signUpAsCompany);
                  }
                },
                child: Text(
                  "Continue",

                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const OptionCard({
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: isSelected ? Colors.blue : Colors.grey),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
