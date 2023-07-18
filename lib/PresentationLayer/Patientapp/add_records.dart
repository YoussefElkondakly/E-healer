import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/PresentationLayer/Patientapp/ShowMedicalRecord.dart';
import 'package:new_windows/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../BussinessLogicLayer/LogIn/login_cubit.dart';
import '../../BussinessLogicLayer/MedicalReport/mrecord_cubit.dart';
import '../../DataLayer/Models/Register/LoginDoc.dart';
import 'medical_record.dart';

class add_records extends StatefulWidget {
  const add_records({Key? key}) : super(key: key);

  @override
  State<add_records> createState() => _add_recordsState();
}

class _add_recordsState extends State<add_records> {
  String textt='   Required';
  String texwt='   Not Required';

  var formkey = GlobalKey<FormState>();
  bool ispass = true;
  var blood_type = TextEditingController();
  var pharmaceutical = TextEditingController();
  var chronic_diseases = TextEditingController();
  var notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(clipBehavior: Clip.none, children: <Widget>[
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
        Padding(
          padding: EdgeInsets.all(10),
          child:  Form(
              key: formkey,
              child: ListView(
                physics: OneScroll,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (context) =>
                                          medical_record()));
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                            )),
                      ),
                      Text('Add Records',
                          style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.sp))
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    width: 375.w,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: SingleChildScrollView(
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            '  Record for',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 1.5.h),
                          ),
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              final User? user =
                                  LoginCubit.get(context).user ?? null;
                              print(user?.apiToken);
                              print(user?.email);
                              return TextField(
                                readOnly: true,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  border: UnderlineInputBorder(),
                                  hintText: user?.name ?? '',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(10, 156, 216, 1),
                                      fontSize: 15.sp,
                                      height: 1.5.h),
                                  suffixIcon: Icon(Icons.edit),
                                ),
                              );
                            },
                          ),
                          Text(
                            '  Blood',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 1.5.h),
                          ),
                          Text(
                            textt,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                height: 1.5.h),
                          ),
                          TextField(
                            controller: blood_type,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              border: UnderlineInputBorder(),
                              hintText: "Enter blood type",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 156, 216, 1),
                                  fontSize: 15.sp,
                                  height: 1.5.h),
                              suffixIcon: Icon(Icons.edit),
                            ),
                          ),
                          Text(
                            '  Medicine',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 1.5.h),
                          ),
                          Text(
                            textt,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                height: 1.5.h),
                          ),
                          TextField(
                            controller: pharmaceutical,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              border: UnderlineInputBorder(),
                              hintText: "Enter medicine",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 156, 216, 1),
                                  fontSize: 15.sp,
                                  height: 1.5.h),
                              suffixIcon: Icon(Icons.edit),
                            ),
                          ),
                          Text(
                            '  Diagnosis',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 1.5.h),
                          ),
                          Text(
                            textt,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                height: 1.5.h),
                          ),
                          TextField(
                            controller: chronic_diseases,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              border: UnderlineInputBorder(),
                              hintText: "Enter diagnosis",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 156, 216, 1),
                                  fontSize: 15.sp,
                                  height: 1.5.h),
                              suffixIcon: Icon(Icons.edit),
                            ),
                          ),
                          Text(
                            '  Notes',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 1.5.h),
                          ),
                          Text(
                            textt,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                height: 1.5.h),
                          ),
                          TextField(
                            controller: notes,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              border: UnderlineInputBorder(),
                              hintText: "Enter Notes",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 156, 216, 1),
                                  fontSize: 15.sp,
                                  height: 1.5.h),
                              suffixIcon: Icon(Icons.edit),
                            ),
                          ),
                          Text("  Type of record",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  height: 3.h)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30.w,
                              ),
                              Icon(Icons.insert_drive_file_rounded,
                                  color: Color.fromRGBO(10, 156, 216, 1)),
                              SizedBox(
                                width: 30.w,
                              ),
                              Icon(Icons.insert_page_break_outlined,
                                  color: Color.fromRGBO(10, 156, 216, 1)),
                              SizedBox(
                                width: 30.w,
                              ),
                              Icon(Icons.insert_chart,
                                  color: Color.fromRGBO(10, 156, 216, 1)),
                              SizedBox(
                                width: 30.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            '  Record created on',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 1.5.h),
                          ),
                          TextField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              border: UnderlineInputBorder(),
                              hintText: "Enter date",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 156, 216, 1),
                                  fontSize: 15.sp,
                                  height: 1.5.h),
                              suffixIcon: Icon(Icons.edit),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Center(
                            child: SizedBox(
                              width: 270.w,
                              height: 54.h,
                              child: BlocConsumer<MrecordCubit, MrecordState>(
                                listener: (context, state) {
                                  LoginCubit.get(context).user?.deviceToken;
                                  if (state is MrecordFailed) {
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
                                  } else if (state is MrecordSuccess) {
                                    Alert(
                                      context: context,
                                      type: AlertType.success,
                                      title: '',
                                      desc: state.message,
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "Okay",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp),
                                          ),
                                          onPressed: () =>
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute<void>(
                                                      builder: (context) =>
                                                          ShowMedicalRecord())),
                                          width: 120.w,
                                        )
                                      ],
                                    ).show();
                                  }
                                },
                                builder: (context, state) {
                                  return state is MrecordLoading
                                      ? Center(
                                    child: CircularProgressIndicator(
                                      color:
                                      Color.fromRGBO(10, 156, 216, 1),
                                    ),
                                  )
                                      : TextButton(
                                    onPressed: () {
                                      if (formkey.currentState!
                                          .validate()) {
                                        MrecordCubit.get(context).mRecord(
                                            blood_type: blood_type.text,
                                            pharmaceutical:
                                            pharmaceutical.text,
                                            chronic_diseases:
                                            chronic_diseases.text,
                                            notes: notes.text);
                                      }
                                    },
                                    child: Text(
                                      "Upload record",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp),
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                      ),
                                      backgroundColor:
                                      MaterialStateProperty.all<
                                          Color>(
                                        Color.fromRGBO(10, 156, 216, 1),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Have Medical Report? ",
                                  style: TextStyle(
                                    fontSize: 18.sp,
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
                                            builder: (context) =>
                                                ShowMedicalRecord()));
                                  },
                                  child: Text(
                                    "Show It",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Color.fromRGBO(10, 156, 216, 1),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '  Chronic Diseases',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 1.5.h),
                          ),
                          Text(
                            texwt,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                height: 1.5.h),
                          ),
                          TextField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              border: UnderlineInputBorder(),
                              hintText: "Chronic Diseases",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 156, 216, 1),
                                  fontSize: 15.sp,
                                  height: 1.5.h),
                              suffixIcon: Icon(Icons.edit),
                            ),
                          ),
                          Text(
                            '  Medical visits',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 1.5.h),
                          ),
                          Text(
                            texwt,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                height: 1.5.h),
                          ),
                          TextField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              border: UnderlineInputBorder(),
                              hintText: "Add Medical visits",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 156, 216, 1),
                                  fontSize: 15.sp,
                                  height: 1.5.h),
                              suffixIcon: Icon(Icons.edit),
                            ),
                          ),
                          Text(
                            '  Surgeries',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 1.5.h),
                          ),
                          Text(
                            texwt,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                height: 1.5.h),
                          ),
                          TextField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              border: UnderlineInputBorder(),
                              hintText: "Add Surgeries if you have",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 156, 216, 1),
                                  fontSize: 15.sp,
                                  height: 1.5.h),
                              suffixIcon: Icon(Icons.edit),
                            ),
                          ),
                          Text(
                            '  Checkups',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                height: 1.5.h),
                          ),
                          Text(
                            texwt,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.sp,
                                height: 1.5.h),
                          ),
                          TextField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              border: UnderlineInputBorder(),
                              hintText: "Add Your Checkups",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(10, 156, 216, 1),
                                  fontSize: 15.sp,
                                  height: 1.5.h),
                              suffixIcon: Icon(Icons.edit),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

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
                  color: Color.fromRGBO(10, 156, 216, 0.30196078431372547),
                  blurRadius: 143,
                  spreadRadius: 90,
                  //New
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
