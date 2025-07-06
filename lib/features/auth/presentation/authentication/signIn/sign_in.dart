import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool secure = true;
  bool? value = false;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    return SafeArea(
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(ImageAssets.logo, height: 180.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "login to your Account",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      CustomTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please enter email";
                          if (!value.contains("@")) return "Invalid email";
                          return null;
                        },
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
                            value: value,
                            onChanged: (bool? newValue) {
                              setState(() {
                                value = newValue;
                              });
                            },
                          ),
                          const Text("Remember me"),
                        ],
                      ),
                      CustomElevatedButton(
                        title: "Sign In",
                        onPress: () async {
                          if (formKey.currentState!.validate()) {
                            DialogUtils.showLoadingDialog(
                              context,
                              message: "Signing in...",
                            );

                            String result = await FirebaseServices.loginUser(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );

                            Navigator.pop(context);

                            if (result == "success") {
                              try {
                                final user = FirebaseAuth.instance.currentUser;
                                final uid = user!.uid;

                                final userDoc = await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(uid)
                                    .get();

                                if (userDoc.exists &&
                                    userDoc.data()!.containsKey('type')) {
                                  final userType = userDoc['type'];

                                  if (userType == 'employee') {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      RoutesManager.home,
                                    );
                                  } else {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      RoutesManager.home2,
                                    );
                                  }
                                } else {
                                  final companyDoc = await FirebaseFirestore
                                      .instance
                                      .collection('companies')
                                      .doc(uid)
                                      .get();

                                  if (companyDoc.exists &&
                                      companyDoc.data()!.containsKey('type')) {
                                    final userType = companyDoc['type'];

                                    if (userType == 'company') {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        RoutesManager.home2,
                                      );
                                    } else {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        RoutesManager.home,
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("User type not found."),
                                      ),
                                    );
                                  }
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Error fetching user data: $e",
                                    ),
                                  ),
                                );
                              }
                            }

                            // if (result == "success") {
                            //   Navigator.pushReplacementNamed(
                            //     context,
                            //     RoutesManager.home,
                            //   );
                            // } else {
                            DialogUtils.showLoadingDialog(
                              context,
                              message: result,
                            );
                          }
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
                              DialogUtils.showLoadingDialog(
                                context,
                                message: "Signing in with Google...",
                              );
                              String result =
                                  await FirebaseServices.signInWithGoogle();
                              Navigator.pop(context);
                              if (result == "success") {
                                Navigator.pushReplacementNamed(
                                  context,
                                  RoutesManager.home,
                                );
                              } else {
                                DialogUtils.showLoadingDialog(
                                  context,
                                  message: result,
                                );
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
                            "Don't have an account?",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          CustomTextButton(
                            title: "Sign Up",
                            onPress: () {
                              Navigator.pushReplacementNamed(
                                context,
                                RoutesManager.signUp,
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
      ),
    );
  }
}
