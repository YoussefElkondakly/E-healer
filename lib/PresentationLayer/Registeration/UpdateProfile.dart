import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../BussinessLogicLayer/UpdateProfile/updateprofile_cubit.dart';
import '../Patientapp/Settings.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController emergency_mobile = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController gender = TextEditingController();
  File? image;
  Future pickImage()async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    }on PlatformException catch(e){print(e);}}

  var formkey = GlobalKey<FormState>();
  bool ispass = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Stack(
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
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
                    child: Row(children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (context) => Settings()));
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                            )),
                      ),
                      Text(
                        "  Update Profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 50.h,
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
                    "Welcome to E-Healer Profile Updater",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 49.h,
                  ),
//name
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: name,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return "Enter Name";
                        }
                        return null;
                      },
                      cursorColor: Color.fromRGBO(10, 156, 216, 1),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        labelText: "Name",
                        hintText: "Name",
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
/*دا بتاع الايميل*/
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: email,
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
                        hintText: "example@gmail.com",
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
/*دا بتاع الموبايل*/
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: mobile,
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
                        labelText: "Phone",
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                        ),
                        hintText: "11 number",
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
/*دا بتاع الباسورد*/
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: Password,
                      validator: (String? val) {
                        if (val!.isEmpty || val.length < 6) {
                          return "incorrect password";
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
                              ispass ? Icons.visibility_off : Icons.visibility,
                            )),
                        hintText: "at least 8 Characters",
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
/*دا بتاع العنوان */
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: address,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return "Enter Address";
                        }
                        return null;
                      },
                      cursorColor: Color.fromRGBO(10, 156, 216, 1),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        labelText: "Address",
                        hintText: "Address",
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
                      controller: birthdate,
                      validator: (String? val) {
                        if (val!.isEmpty ) {
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
                        if (val!.isEmpty ){
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
                  /*دا بتاع الصورة */
                  if(image==null)
                    Row(
                      children: [
                        IconButton(
                          onPressed:pickImage,
                          icon: Icon(Icons.add),
                        ),
                        Text('Upload your image')
                      ],
                    ),
                  if(image!=null)
                    Center(
                      child: Container(width: 100.w,height: 100.h,
                        child: Image.file(image!),
                      ),
                    ),
                  SizedBox(
                    height: 18.h,
                  ),

//------------------------------------
                  SizedBox(
                    height: 26.h,
                  ),
                  BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                    listener: (context, state) {
                      if (state is UpdateProfileFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            state.error,
                          ),
                          duration: Duration(
                            seconds: 3,
                          ),
                          backgroundColor: Colors.red,
                        ));
                      } else if (state is UpdateProfileSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Your Profile Updated Successfully",
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
                                const Settings()));
                      }

                    },
                    builder: (context, state) {
                      return state is UpdateProfileLoading
                          ? Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(10, 156, 216, 1),
                        ),
                      )
                          : TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            UpdateProfileCubit.get(context).update(
                                name: name.text,
                                email: email.text,
                                mobile: mobile.text,
                                password: Password.text,
                                address:address.text,
                                image: image!,
                                emergency_mobile: emergency_mobile.text,
                                birthdate: birthdate.text,
                                gender:gender.text,

                            );
                          }
                        },
                        child: Text(
                          "Update Profile",
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
        ),
      ),
    );
  }
}
