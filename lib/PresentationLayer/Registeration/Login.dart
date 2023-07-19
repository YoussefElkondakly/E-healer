import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../BussinessLogicLayer/LogIn/login_cubit.dart';
import '../../main.dart';
import '../Doctorapp/BottomNavD.dart';
import '../Patientapp/BottomNav.dart';
import 'SignUp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mail = TextEditingController();
  var password = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool ispass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  /*دي الدايرة المتشبحنه اللي فوق*/
                  Positioned(
                    left: -129,
                    top: -63,
                    child: Container(
                      width: 216.w,
                      height: 216.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                10, 156, 216, 0.30196078431372547),
                            blurRadius: 143,
                            spreadRadius: 90,
                            //New
                          )
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 127.h,
                            ),
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "If you don’t take care of your health.",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "We will !",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 49.h,
                            ),
                            /*دا بتاع الايميل*/
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: mail,
                                validator: (String? val) {
                                  if (val!.isEmpty || !val.contains("@")) {
                                    return "Invalid mail";
                                  }
                                  return null;
                                },
                                cursorColor: Color.fromRGBO(10, 156, 216, 1),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  labelText: "E-mail",
                                  suffixIcon: Icon(Icons.alternate_email),

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color.fromRGBO(10, 156, 216, 1)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color.fromRGBO(10, 156, 216, 1)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            /*دا بتاع الباسورد*/
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: password,
                                validator: (String? val) {
                                  if (val!.isEmpty || val.length < 6) {
                                    return "Invalid password";
                                  }
                                  return null;
                                },
                                obscureText: ispass,
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: Color.fromRGBO(10, 156, 216, 1),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          ispass = !ispass;
                                        });
                                      },
                                      icon: Icon(
                                        ispass
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      )),

                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color.fromRGBO(10, 156, 216, 1)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: Color.fromRGBO(10, 156, 216, 1)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 152.h,
                            ),
                            BlocConsumer<LoginCubit, LoginState>(
                              listener: (context, state) {
                                if (state is LoginFailed) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      state.error,
                                    ),
                                    duration: Duration(
                                      seconds: 3,
                                    ),
                                    backgroundColor: Colors.red,
                                  ));
                                } else if (state is LoginSuccess) {
                                  pass.setString('pass', password.text);
                                  if (state.user.userType == "user") {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute<void>(
                                            builder: (context) =>
                                            const BottomNav()));
                                  } else {
                                    print("Doctor");
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute<void>(
                                            builder: (context) =>
                                            const BottomNavD()));
                                  }
                                }

                              },
                              builder: (context, state) {
                                return state is LoginLoading
                                    ? Center(
                                  child: CircularProgressIndicator(),
                                )
                                    : TextButton(
                                  onPressed: () {
                                    if (_formkey.currentState!
                                        .validate()) {
                                      LoginCubit.get(context).login(
                                          email: mail.text,
                                          password: password.text);
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                    ),
                                    padding: MaterialStateProperty.all<
                                        EdgeInsets>(
                                        EdgeInsets.fromLTRB(
                                            115, 15, 115, 15)),
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                      Color.fromRGBO(10, 156, 216, 1),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     //دا بقا لسا الشغل عليه مش عارفه
                            //     Navigator.pushReplacement(
                            //         context,
                            //         MaterialPageRoute<void>(
                            //             builder: (context) => const Login()));
                            //   },
                            //   child: Text(
                            //     "Forgot Password",
                            //     style: TextStyle(
                            //       fontSize: 14.sp,
                            //       color: Color.fromRGBO(10, 156, 216, 1),
                            //       fontWeight: FontWeight.w400,
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 123.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Don't Have Acoount? ",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color.fromRGBO(10, 156, 216, 1),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //دا الtext اللي بينقلك على صفحةال SignUp
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute<void>(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color.fromRGBO(10, 156, 216, 1),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  /*دي الدايرة المتشبحنه اللي تحت*/
                  Positioned(
                    left: 300,
                    top: 659,
                    child: Container(
                      width: 216.w,
                      height: 216.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(
                                10, 156, 216, 0.30196078431372547),
                            blurRadius: 143,
                            spreadRadius: 90,
                            //New
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
