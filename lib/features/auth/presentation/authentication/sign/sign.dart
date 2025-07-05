import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ready_hire/features/auth/presentation/authentication/sign/widgets/login_button.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/dialog_utils.dart';
import '../../../../../core/routes_manager/routes_manager.dart';
import '../../../../../data/firebase_service/firebase_service.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  bool isLoading = false;
  String welcome = "Facebook";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(ImageAssets.second, height: 150.h,),
                SizedBox(height: 20.h),
                Text(
                  'Submit your resume and let\n us amaze you with our results \n Rapid Solutions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30.sp),
                LoginButton(
                  imagePath: 'assets/images/face.png',
                  text: 'Sign up with Facebook',
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  backgroundColor: Colors.white,
                  onPressed: () {


                  },
                ),
                const SizedBox(height: 10),

                LoginButton(
                  imagePath: 'assets/images/google.png',
                  text: 'Sign up with Google',
                  textColor: Colors.black,
                  borderColor: Colors.black,
                  backgroundColor: Colors.white,
                  onPressed: () async {
                    DialogUtils.showLoadingDialog(
                        context, message: "Signing in with Google...");
                    String result = await FirebaseServices.signInWithGoogle();
                    Navigator.pop(context);
                    print(result);
                    if (result == "success") {
                      Navigator.pushReplacementNamed(
                          context, RoutesManager.home);
                    } else {
                      DialogUtils.showMessageDialog(context, result);
                    }
                  },
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),


                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesManager.signIn,
                    );
                  },
                  child: const Text(
                    'Sign in With Email',
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesManager.signUp,
                        );
                      },
                      child: const Text('Sign UP'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}



