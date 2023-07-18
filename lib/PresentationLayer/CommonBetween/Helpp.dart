import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Doctorapp/BottomNavD.dart';
import '../Patientapp/BottomNav.dart';

class Helpp extends StatefulWidget {
  const Helpp({Key? key}) : super(key: key);

  @override
  State<Helpp> createState() => _HelppState();
}

class _HelppState extends State<Helpp> {
  var formkey = GlobalKey<FormState>();
  bool ispass = true;
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

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Center(child: IconButton(
                                    onPressed: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute<void>(builder: (context)=>BottomNav(),
                                      ),);
                                    },
                                    icon:Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),
                                  ),),
                                  height: 30.h,
                                  width: 30.w,
                                  margin: EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                ),
                                 Text(
                                  "Help Center",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,

                                  border:UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none),
                                  hintText: "I have an issue with",
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(10, 156, 216, 1),
                                  ),
                                ),
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Booking a new Appointment",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1)
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(103, 114, 148, 1)),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Existing Appointment",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1)
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(103, 114, 148, 1)),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Online Consultations",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1)
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(103, 114, 148, 1)),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Feedbacks",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1)
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(103, 114, 148, 1)),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Medicine Orders",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1)
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(103, 114, 148, 1)),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Diagnostic Tests",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1)
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(103, 114, 148, 1)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Health Plans",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1)
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(103, 114, 148, 1)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "My account and Practo Drive",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1)
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(103, 114, 148, 1)),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Have a Feature in Mind",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1)
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(103, 114, 148, 1)),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    "Others Issues",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1)
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(103, 114, 148, 1)),
                              ],
                            ),




                          ],
                        ),

                      )),
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
