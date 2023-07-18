import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Registeration/Login.dart';
import 'Welcome3.dart';

class Welcome2 extends StatefulWidget {
  const Welcome2({Key? key}) : super(key: key);

  @override
  State<Welcome2> createState() => _Welcome2State();
}

class _Welcome2State extends State<Welcome2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -142,
              top: -20,
              child: Container(
                width: 342.w,
                height: 342.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(10, 156, 216, 1),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 19,
              top: 91,
              child: Container(
                width: 336.w,
                height: 336.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(10, 156, 216, 1),
                  image: DecorationImage(
                    image: AssetImage('assets/welcome/img_1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 511,
              left: 20,
              right: 20,
              child: Column(
                children: <Widget>[
                  Text(
                    "Choose Best Doctors",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30.sp,
                        letterSpacing: .3),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Text(
                    "Any Specialization You Want\n You Will Find It Here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.656.h,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color.fromRGBO(103, 114, 148, 1),
                    ),
                  ),
                  SizedBox(
                    height: 53.h,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) => Welcome3()));
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.fromLTRB(115, 15, 115, 15)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(10, 156, 216, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) => const Login()));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Color.fromRGBO(103, 114, 148, 1),
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
