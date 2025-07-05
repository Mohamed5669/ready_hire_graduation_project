import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_hire/core/resources/assets_manager.dart';
import 'package:ready_hire/core/resources/constant_manager.dart';
import 'package:ready_hire/core/resources/controllers.dart';

import '../../../../core/routes_manager/routes_manager.dart';
import '../widgets/build_page1.dart';
import '../widgets/build_page2.dart';
import '../widgets/onboarding_dot.dart';
import '../widgets/onboarding_page_without_card.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RoutesManager.sign);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: Controllers.pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  OnboardingPageWithoutCard(
                    imagePath: ImageAssets.first,
                    title: ConstantsManager.onBoardingTitle1,
                    description: ConstantsManager.onBoardingDescription1,
                  ),
                  BuildPage1(
                    imagePath: ImageAssets.second,
                    title: ConstantsManager.onBoardingTitle2,
                  ),
                  BuildPage2(
                    imagePath: ImageAssets.second,
                    title: ConstantsManager.onBoardingTitle3,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) =>
                    OnboardingDot(index: index, currentPage: _currentPage),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < 2) {
                    Controllers.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.pushReplacementNamed(context, RoutesManager.sign);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: REdgeInsets.symmetric(horizontal: 50),
                ),
                child: Text(_currentPage < 2 ? "Next" : "Get Start"),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
