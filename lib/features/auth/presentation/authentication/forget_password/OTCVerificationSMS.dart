import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ready_hire/features/auth/presentation/authentication/forget_password/CreateNewPasswordScreen.dart';

class OTCVerificationSMS extends StatefulWidget {
  const OTCVerificationSMS({super.key});

  @override
  _OTCVerificationSMSState createState() => _OTCVerificationSMSState();
}

class _OTCVerificationSMSState extends State<OTCVerificationSMS> {
  TextEditingController otpController = TextEditingController();
  int _resendCodeTimer = 55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: REdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "OTP Code Verification",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Text(
              "Enter code sent to\n +201******91",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
            SizedBox(height: 20.h),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.grey[200],
                inactiveFillColor: Colors.grey[200],
              ),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              controller: otpController,
              onChanged: (value) {
                print("Current OTP: $value");
              },
            ),
            SizedBox(height: 20),
            Text(
              "Resend Code in $_resendCodeTimer s",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Entered OTP: ${otpController.text}");

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateNewPassword()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: REdgeInsets.symmetric(horizontal: 100),
              ),

              child: Text("continue"),
            ),
          ],
        ),
      ),
    );
  }
}
