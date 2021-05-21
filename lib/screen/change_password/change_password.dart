import 'package:flutter/material.dart';
import 'package:sellbag/screen/bottom_bar/bottom_bar.dart';
import 'package:sellbag/screen/login/login_page.dart';


class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool _hidePass = true;
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
                          builder: (context) => BottomBarPage(),
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
                    'Change\npassword!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'BalooTammudu2',
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Form(
                          key: _form,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.number,
                                obscureText: _hidePass,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                  hintText: 'Current password',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.grey[400],
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
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                obscureText: _hidePass,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                  hintText: 'New password',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.grey[400],
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
                                height: 25,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                obscureText: _hidePass,
                                style: TextStyle(),
                                decoration: InputDecoration(
                                  hintText: 'Confirn new password',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.grey[400],
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
                                height: 35,
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
                                            builder: (context) => LoginPage(),
                                          ),
                                        );
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Change',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
