import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../otp_screen/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                exit(0);
              }),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.red,
                    // decoration: TextDecoration.underline,
                  ),
                ))
          ]),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        // alignment: Alignment.center,
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
                height: 30,
              ),
              // Icon(Icons.person),
              Container(
                height: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey[100]!, // Border color
                    width: 1, // Border width
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Image.asset('assets/images/user.png',
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey[300]!),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: TextField(
                            textAlign: TextAlign.center,
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "+91 6845684142",
                                hintStyle: TextStyle(color: Colors.grey[400]!,
                                fontWeight: FontWeight.w400)),
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Color(0xFF024163),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20)),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          auth.verifyPhoneNumber(
                            phoneNumber: phoneNumberController.text,
                            verificationCompleted: (_) {},
                            verificationFailed: (FirebaseAuthException e) {
                              setState(() {
                                isLoading = false;
                              });
                              if (e.code == 'invalid-phone-number') {
                                print(
                                    'The provided phone number is not valid.');
                              }
                            },
                            codeSent: (String verificationId, int? token) {
                              setState(() {
                                isLoading = true;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpScreen(
                                          verificationId: verificationId)));
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                          print('code has been sent!');
                        },
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Text("Send code",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'By continuing you are agreeing to our\n',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(
                                color: Color(0xFF4082a0),
                                textBaseline: TextBaseline.alphabetic,
                                fontSize: 13, // Adjust the font size as needed
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
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Color(0xFF4082a0),
                                textBaseline: TextBaseline.alphabetic,
                                fontSize: 13, // Adjust the font size as needed
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Action for 'Privacy Policy' tap
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
