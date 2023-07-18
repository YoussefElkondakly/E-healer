import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'BottomNav.dart';
import 'add_records.dart';

class medical_record extends StatefulWidget {
  const medical_record({Key? key}) : super(key: key);

  @override
  State<medical_record> createState() => _medical_recordState();
}

class _medical_recordState extends State<medical_record> {
  var formkey = GlobalKey<FormState>();
  bool ispass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: LayoutBuilder(builder: (context, constraint) {
          return Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
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
                        color:
                            Color.fromRGBO(10, 156, 216, 0.30196078431372547),
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
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (context) => BottomNav()));
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black,
                                )),
                          ),
                          Text('Medical Records',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.sp))
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Container(
                        width: 214.w,
                        height: 214.h,
                        child: Center(
                          child: Icon(
                            Icons.assignment_add,
                            size: 90,
                            color: Color.fromRGBO(10, 156, 216, 1),
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(198, 239, 216, 1),
                        ),
                      ),
                      SizedBox(
                        height: 53.h,
                      ),
                      Text(
                        "Add a medical record.",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25.sp,
                            letterSpacing: .3),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Text(
                        "A detailed health history helps a doctor diagnose you better",
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
                      SizedBox(
                        width: 270.w,
                        height: 54.h,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => add_records()));
                          },
                          child: Text(
                            "Add a record",
                            style: TextStyle(color: Colors.white, fontSize: 20.sp),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(10, 156, 216, 1),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                        color:
                            Color.fromRGBO(10, 156, 216, 0.30196078431372547),
                        blurRadius: 143,
                        spreadRadius: 90,
                        //New
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
