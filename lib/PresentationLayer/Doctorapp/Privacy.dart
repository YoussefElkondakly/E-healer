import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CommonBetween/Helpp.dart';
class privacy extends StatefulWidget {
  const privacy({Key? key}) : super(key: key);

  @override
  State<privacy> createState() => _privacyState();
}

class _privacyState extends State<privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
            height: 812.h,
            width: 375.w,
            child: LayoutBuilder(
                builder: (context, constraint) {
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
                                  color: Color.fromRGBO(10, 156, 216, 0.30196078431372547),
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
                                child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 30.h,
                                            width: 30.w,
                                            margin: EdgeInsets.all(10.0),
                                            decoration :BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                            ),

                                            child: IconButton(
                                                onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute<void>(
                                                    builder: (context) => Helpp()));  },
                                                icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,
                                                  size: 15,
                                                )
                                            ),
                                          ),
                                           Text(
                                            "Privacy Policy",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Container(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          'E_Healer Apps Privacy Policy',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18.sp,
                                              color: Color.fromRGBO(103, 114, 148, 1)
                                          ),
                                        ),
                                      ),

                                      Container(
                                        padding: EdgeInsets.only(left: 20.0,right: 30,top: 10),
                                        child: Text(
                                          "This Privacy Policy describes how Medical Information Technology, Inc.’s (“MEDITECH”) mobile application (the"
                                              "“MEDITECH Application”) uses and transmits information and data.  By using the MEDITECH Application, you consent"
                                              "to this Privacy Policy and the terms herein.  MEDITECH may change this Privacy Policy from time to time.  It is your"
                                              "responsibility to check this webpage periodically to see if any terms have been changed or modified.  Your continued"
                                              "use of the MEDITECH Application constitutes your acceptance of any updates to this Privacy Policy."
                                          ,
                                          style: TextStyle (
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.sp,
                                              height: 1.5.h,

                                              color: Color.fromRGBO(149, 156, 180, 0.8)
                                          ),
                                        ),
                                      ),



                                    ]
                                )
                            )
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
                                  color: Color.fromRGBO(10, 156, 216, 0.30196078431372547),
                                  blurRadius: 143,
                                  spreadRadius: 90,
                                  //New
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]);
                }
            ),
        ),
    );
  }
}
