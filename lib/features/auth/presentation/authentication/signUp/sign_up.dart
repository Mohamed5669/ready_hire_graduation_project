import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/dialog_utils.dart';
import '../../../../../core/routes_manager/routes_manager.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_divider.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../data/firebase_service/firebase_service.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  bool secure = true;
  bool? rememberMe = false;
  bool? agreedToPrivacy = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  void _onClick() {
    setState(() {
      secure = !secure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(ImageAssets.logo, height: 180.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Create New Account",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      CustomTextFormField(
                        controller: emailController,
                        label: "Email",
                        prefixIcon: Icons.email_rounded,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please enter password";
                          if (value.length < 6)
                            return "Password must be at least 6 characters";
                          return null;
                        },
                        controller: passwordController,
                        isSecure: secure,
                        label: "Password",
                        prefixIcon: Icons.lock,
                        suffixIcon: secure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onPress: _onClick,
                      ),

                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (bool? newValue) {
                              setState(() {
                                rememberMe = newValue;
                              });
                            },
                          ),
                          const Text("Remember me"),
                        ],
                      ),
                      CustomElevatedButton(
                        title: "Sign Up",
                        onPress: () {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please fill all fields'),
                              ),
                            );
                            return;
                          }

                          if (agreedToPrivacy != true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'You must agree to Privacy Policy',
                                ),
                              ),
                            );
                            return;
                          }

                          Navigator.pushNamed(context, RoutesManager.selectJob);
                        },
                      ),
                      SizedBox(height: 10.h),
                      CustomTextButton(
                        title: "Forget your password ?",
                        alignment: Alignment.topLeft,
                        onPress: () {
                          Navigator.pushNamed(
                            context,
                            RoutesManager.forgetPassword,
                          );
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: agreedToPrivacy,
                            onChanged: (bool? newValue) {
                              setState(() {
                                agreedToPrivacy = newValue!;
                              });
                            },
                          ),
                          const Expanded(
                            child: Text(
                              "I agree to and adhere to Ready Hire's",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RoutesManager.privacy,
                              );
                            },
                            child: const Text(
                              "Privacy Policies",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      CustomDivider(title: "or continue with"),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            onTap: () {},
                            imagePath: 'assets/images/facebook_icon.png',
                          ),
                          SizedBox(width: 20.w),
                          CustomButton(
                            onTap: () async {
                              DialogUtils.showLoadingDialog(context,
                                  message: "Signing in with Google...");
                              String result = await FirebaseServices
                                  .signInWithGoogle();
                              Navigator.pop(context);
                              print(result);
                              if (result == "success") {
                                Navigator.pushReplacementNamed(
                                    context, RoutesManager.home);
                              } else {
                                DialogUtils.showMessageDialog(context, result);
                              }
                            },
                            imagePath: 'assets/images/google_icon.png',
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                          ),
                          CustomTextButton(
                            title: "Sign In",
                            onPress: () {
                              Navigator.pushReplacementNamed(
                                context,
                                RoutesManager.sign,
                              );
                            },
                          ),
                        ],
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
