import 'package:flutter/material.dart';
import 'package:sellbag/constants.dart';
import 'package:sellbag/screen/bottom_bar/bottom_bar.dart';
import 'package:sellbag/screen/forget_password/forget_password.dart';
import 'package:sellbag/screen/signup/sign_up.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool _hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome\nback!',
                    style: TextStyle(
                      color: primarytextcolor,
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: secondarytextcolor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 7,
                        width: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color:secondarycolor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 7,
                        width: 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: secondarytextcolor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            color: primarytextcolor,
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(
                            color: primarytextcolor,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
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
                          height: 25,
                        ),
                        Text(
                          'PassWord',
                          style: TextStyle(
                            fontSize: 15,
                            color: primarytextcolor,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          obscureText: _hidePass,
                          style: TextStyle(
                            color: primarytextcolor,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: secondarytextcolor,
                            ),
                            suffixIcon: GestureDetector(
                              child: Icon(
                                _hidePass
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                                size: 25,
                              ),
                              onLongPress: () => {
                                setState(() => _hidePass = false),
                              },
                              onLongPressEnd: (_) {
                                setState(() => _hidePass = true);
                              },
                            ),
                          ),
                          validator: (_password) {
                            bool _passwordValid =
                                RegExp(r"^[0-9]+$").hasMatch(_password);
                            if (_password.isEmpty)
                              return 'Please enter your password';
                            if (!_passwordValid)
                              return 'Please Enter valid password';
                            // if (_password.length < 6 || _password.length >= 7)
                            //   return 'Please Enter valid password';
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPassword(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forget Password?',
                                style: TextStyle(
                                  color: secondarycolor,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
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
                                        builder: (context) => BottomBarPage()),
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
                                    'Login',
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
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Do you have any account? ',
                              style: TextStyle(
                                color: primarytextcolor,
                                fontSize: 16,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: Text(
                                'sign Up',
                                style: TextStyle(
                                  color: secondarycolor,
                                  fontSize: 16,
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
