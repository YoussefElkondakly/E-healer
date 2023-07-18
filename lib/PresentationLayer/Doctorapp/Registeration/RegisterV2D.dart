import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/PresentationLayer/Doctorapp/BottomNavD.dart';
import 'package:new_windows/PresentationLayer/Doctorapp/SettingsD.dart';

import '../../../BussinessLogicLayer/Register/register_v2_cubit.dart';
class RegisterV2D extends StatefulWidget {
  const RegisterV2D({Key? key}) : super(key: key);

  @override
  State<RegisterV2D> createState() => _RegisterV2DState();
}

class _RegisterV2DState extends State<RegisterV2D>{
  TextEditingController emergency_mobile = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController gender = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Stack(
          clipBehavior: Clip.none,
          children:<Widget> [

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
              child: Column(

                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 25, 0
                        , 0),
                    child: Row(children:<Widget>[
                      CircleAvatar(backgroundColor: Colors.white,child: IconButton(
                          onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute<void>(
                              builder: (context) => SettingsD()));  },
                          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)
                      ),),
                      Text(
                        "  Complete Verification",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Text(
                    "Hi ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Please Complete your profile",
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
                    "To make it easy to contact with you ❤",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 49.h,
                  ),
                  /*دا بتاع emergency*/
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: emergency_mobile,
                      validator: (String? val) {
                        if (val!.isEmpty || val.length < 11) {
                          return "invalid Phone";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      cursorColor: Color.fromRGBO(10, 156, 216, 1),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        labelText: "Emergency Number",
                        labelStyle: TextStyle(
                          fontSize: 16,
                        ),
                        hintText: "11 number",
                        hintStyle: TextStyle(
                          fontSize: 16,
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
                    height: 18.h,
                  ),
                  /*دا بتاع تاريخ الميلاد */
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller:birthdate,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return "Invalid Birth Date";
                        }
                        return null;
                      },
                      cursorColor: Color.fromRGBO(10, 156, 216, 1),
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        labelText: "Birth Date",
                        suffixIcon: Icon(Icons.date_range),
                        hintText: "2001-11-29",
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
                  /*دا بتاع الجنس*/
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: gender,
                      validator: (String? val) {
                        if (val!.isEmpty ) {
                          return "Write male or female";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      cursorColor: Color.fromRGBO(10, 156, 216, 1),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        labelText: "Gender",
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                        ),
                        hintText: "male or female",
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
                    height: 18.h,
                  ),
                  BlocConsumer<RegisterV2Cubit, RegisterV2State>(
                    listener: (context, state) {
                      if (state is RegisterV2Failed) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            state.error,
                          ),
                          duration: Duration(
                            seconds: 3,
                          ),
                          backgroundColor: Colors.red,
                        ));
                      } else if (state is RegisterV2Success) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "تم عملية تكملة البيانات بنجاح",
                          ),
                          duration: Duration(
                            seconds: 3,
                          ),
                          backgroundColor: Color.fromRGBO(10, 156, 216, 1),
                        ));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) =>
                                const BottomNavD()));
                      }

                    },
                    builder: (context, state) {
                      return state is RegisterV2Loading
                          ? Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(10, 156, 216, 1),
                        ),
                      )
                          : TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            RegisterV2Cubit.get(context).registerV2(
                              emergency_mobile :emergency_mobile.text,
                              birthdate :birthdate.text,
                              gender :gender.text,
                            );
                          }
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      );
                    },
                  ),

                  SizedBox(
                    height: 16.h,
                  ),

                ],
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
      ),
    );
  }
}
