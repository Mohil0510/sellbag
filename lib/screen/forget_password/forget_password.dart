import 'package:flutter/material.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/screen/OTP/otp.dart';
import 'package:sellbag/screen/login/login_page.dart';


class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Forget\npassword!',
                    style: TextStyle(
                      color: primarytextcolor,
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _form,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(
                            color: primarytextcolor,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Email adress',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: secondarytextcolor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          validator: (_email) {
                            bool _emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(_email);
                            if (_email.isEmpty)
                              return 'Please enter your email';
                            if (!_emailValid) return 'Please Enter valid email';
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_form.currentState.validate())
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Otp(),
                                    ),
                                  );
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: secondarycolor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Send',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
