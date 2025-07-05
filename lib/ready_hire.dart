import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_hire/core/extensions/build_context_extension.dart';
import 'config/theme/theme_manager.dart';
import 'core/routes_manager/routes_manager.dart';

class ReadyHire extends StatelessWidget {
  const ReadyHire({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.getScreenWidth, context.getScreenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.light,
        onGenerateRoute: RoutesManager.router,
        initialRoute: RoutesManager.splash,
      ),
    );
  }
}
