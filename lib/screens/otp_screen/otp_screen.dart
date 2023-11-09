import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;

  const OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  Future<void> signInWithOTP(String smsCode, BuildContext context) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

      // If the verification is successful, navigate to the home screen
      Navigator.pushNamed(context, '/home_screen');

      Fluttertoast.showToast(
        msg: "Sign in successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {
      // Handle the case when the entered OTP is incorrect or verification fails
      Fluttertoast.showToast(
        msg: "Invalid OTP. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle 'Skip' action
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img1.png',
                width: 280,
                height: 280,
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey[100]!, // Border color
                    width: 1, // Border width
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/password.png',
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: Colors.black,
                      fieldWidth: 40,
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      showFieldAsBox: false,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        signInWithOTP(verificationCode, context);
                      },
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {},
                        child: Text('Continue'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF024163)),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'By continuing you are agreeing to our\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              color: Color(0xFF4082a0),
                              textBaseline: TextBaseline.alphabetic,
                              fontSize: 13,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Action for 'Terms & Conditions' tap
                              },
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Color(0xFF4082a0),
                              textBaseline: TextBaseline.alphabetic,
                              fontSize: 13,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Action for 'Privacy Policy' tap
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
