import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../BussinessLogicLayer/Register/signup_cubit.dart';
import 'Login.dart';
import '../CommonBetween/TermsOfServicep.dart';

class Doctor extends StatefulWidget {
  const Doctor({Key? key}) : super(key: key);
  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  var name = TextEditingController();
  var mail = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();
  var passwordConfirm = TextEditingController();
  var address = TextEditingController();
  var usertype = TextEditingController();

  var formkey = GlobalKey<FormState>();
  bool ispass = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            /*دا بتاع الاسم*/
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
                controller: phone,
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
                controller: password,
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
                  hintText: "at least 6 Characters",
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
            /*دا بتاع اعادة الباسورد*/
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                controller: passwordConfirm,
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
                  labelText: "Password Confirmation ",
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
                  hintText: "at least 6 Characters",
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
            /*دا بتاع الصورة */
            if (image == null)
              Row(
                children: [
                  IconButton(
                    onPressed: pickImage,
                    icon: Icon(Icons.add),
                  ),
                  Text('Upload your image')
                ],
              ),
            if (image != null)
              Center(
                child: CircleAvatar(
                  child: Image.file(image!),
                ),
              ),
            SizedBox(
              height: 18.h,
            ),

            //------------------------------------
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    shape: CircleBorder(),
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        usertype = TextEditingController(text: 'doctor');
                        print(usertype);
                        isChecked = value!;
                      });
                    }),
                Text(
                  "I Agree With The ",
                  style: TextStyle(
                    wordSpacing: .0001,
                    fontSize: 12.sp,
                    color: Color.fromRGBO(103, 114, 148, 1.0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //دا الtext اللي بينقلك على صفحةال SignUp
                    Navigator.push(context,
                        MaterialPageRoute<void>(builder: (context) => terms()));
                  },
                  child: Text(
                    "Terms of service & Privacy Policy",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color.fromRGBO(103, 114, 148, 1.0),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is RegisterFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      state.error,
                    ),
                    duration: Duration(
                      seconds: 3,
                    ),
                    backgroundColor: Colors.red,
                  ));
                } else if (state is RegisterSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      state.message??'',
                    ),
                    duration: Duration(
                      seconds: 3,
                    ),
                    backgroundColor: Color.fromRGBO(10, 156, 216, 1),
                  ));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                          builder: (context) => const Login()));
                }
              },
              builder: (context, state) {
                return state is RegisterLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(10, 156, 216, 1),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            SignupCubit.get(context).register(
                                name: name.text,
                                email: mail.text,
                                mobile: phone.text,
                                password: password.text,
                                password_confirmation: passwordConfirm.text,
                                user_type: usertype.text,
                                address: address.text,
                                image: image!);
                          }
                        },
                        child: Text(
                          "SignUp",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Have an Acoount? ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromRGBO(10, 156, 216, 1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //دا الtext اللي بينقلك على صفحةال SignUp
                    Navigator.pushReplacement(context,
                        MaterialPageRoute<void>(builder: (context) => Login()));
                  },
                  child: Text(
                    "Log in",
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
    );
  }
}
