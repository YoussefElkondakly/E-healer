import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Registeration/Login.dart';

class Welcome3 extends StatefulWidget {
  const Welcome3({Key? key}) : super(key: key);

  @override
  State<Welcome3> createState() => _Welcome3State();
}

class _Welcome3State extends State<Welcome3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: -104,
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
                    image: AssetImage('assets/welcome/img_2.png'),
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
                    "You Can Easily Book an Offline Appointment\n Without Going and Wait.",
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
                              builder: (context) => Login()));
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.fromLTRB(97, 19, 97, 19)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(10, 156, 216, 1),
                      ),
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
