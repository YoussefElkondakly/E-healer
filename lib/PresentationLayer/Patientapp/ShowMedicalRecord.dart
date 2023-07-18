import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/DataLayer/Models/Doctor/Editing/UpdateMedicalRecordModel.dart';
import 'package:new_windows/PresentationLayer/Patientapp/BottomNav.dart';
import '../../BussinessLogicLayer/MedicalReport/mrecord_cubit.dart';
import '../../DataLayer/Models/Register/LoginDoc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../BussinessLogicLayer/LogIn/login_cubit.dart';
import '../../DataLayer/Models/medicalRecord_model.dart';
import 'add_records.dart';
class ShowMedicalRecord extends StatefulWidget {
  const ShowMedicalRecord({Key? key}) : super(key: key);

  @override
  State<ShowMedicalRecord> createState() => _ShowMedicalRecordState();
}

class _ShowMedicalRecordState extends State<ShowMedicalRecord> {
  var formkey = GlobalKey<FormState>();
  bool ispass = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(clipBehavior: Clip.none, children: <Widget>[
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
            child:Container(height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
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
                                            add_records()));
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                              )),
                        ),
                        Text('My Record',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: 20.sp))
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      width: 375.w,
                      height: MediaQuery.of(context).size.height*.75,
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
                                  color: Colors.black, fontSize: 15.sp, height: 1.5.h),
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
                            BlocBuilder<MrecordCubit, MrecordState>(
                              builder: (context, state) {
                                final UserRecord? user = MrecordCubit.get(context).user ?? null;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '  Blood',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.sp, height: 1.5.h),
                                    ),
                                    TextField(readOnly: true,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 10.0),
                                        border: UnderlineInputBorder(),
                                        hintText: user?.bloodType??'A+',
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
                                          color: Colors.black, fontSize: 15.sp, height: 1.5.h),
                                    ),
                                    TextField(
                                      readOnly: true,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 10.0),
                                        border: UnderlineInputBorder(),
                                        hintText: user?.pharmaceutical??'Congestal',
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
                                          color: Colors.black, fontSize: 15.sp, height: 1.5.h),
                                    ),
                                    TextField(
                                      readOnly: true,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 10.0),
                                        border: UnderlineInputBorder(),
                                        hintText: user?.chronicDiseases??'cough',
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
                                          color: Colors.black, fontSize: 15.sp, height: 1.5.h),
                                    ),
                                    TextField(
                                      readOnly: true,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 10.0),
                                        border: UnderlineInputBorder(),
                                        hintText:user?.notes??'No notes are added',
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
                                          color: Colors.black, fontSize: 15.sp, height: 1.5.h),
                                    ),
                                    TextField(readOnly: true,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 10.0),
                                        border: UnderlineInputBorder(),
                                        hintText: user?.createdAt??'2023-06-21',
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


                                  ],
                                );
                              },
                            ),
                          ],

                        ),
                      ),

                    ),
                    Column(
                      children:<Widget> [
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 500.w,
                          height: 306.h,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Color.fromARGB(20, 0, 0, 0),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Column(children: [
                            Row(children: [
                              Text("Vital ",
                                style: TextStyle(
                                    fontSize: 20.sp,fontWeight: FontWeight.bold),),
                              Text("| ",style: TextStyle(
                                  fontSize: 15.sp,color: Colors.grey),),
                              Text("Last update 3 days ago",style: TextStyle(
                                  fontSize: 15.sp,color: Colors.grey),),
                            ],),
                            SizedBox(height: 25.h,),
                            Row(children: [
                              Text("Height",style: TextStyle(
                                  fontSize: 20.sp,fontWeight: FontWeight.bold),),
                              SizedBox(width: 150.w,),
                              Text("Weight",style: TextStyle(
                                  fontSize: 20.sp,fontWeight: FontWeight.bold),),
                            ],),
                            SizedBox(height: 20.h,),
                            Row(children: [
                              Text("180 cm",style: TextStyle(
                                fontSize: 20.sp,),),
                              SizedBox(width: 150.w,),
                              Text("95",style: TextStyle(
                                fontSize: 20.sp,),),
                            ],),
                            SizedBox(height: 10.h,),
                            Row(children: [
                              Text("Blood Pressure",style: TextStyle(
                                  fontSize: 20.sp,fontWeight: FontWeight.bold),),
                              SizedBox(width: 75.w,),
                              Text("BMI",style: TextStyle(
                                  fontSize: 20.sp,fontWeight: FontWeight.bold),),
                            ],),
                            SizedBox(height: 20.h,),
                            Row(children: [
                              Text("120/80",style: TextStyle(
                                fontSize: 20.sp,),),
                              SizedBox(width: 150.w,),
                              Text("29.3",style: TextStyle(
                                  fontSize: 20.sp),),
                            ],),
                          ],),
                        ),
                        SizedBox(height: 20.h,),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 500.w,
                          height: 306.h,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Color.fromARGB(20, 0, 0, 0),
                              ),
                            ],
                            color: Colors.white,

                          ),
                          child: Column(children: [
                            Row(children: [
                              Text("Chronic Diseases",
                                style: TextStyle(
                                    fontSize: 20.sp,fontWeight: FontWeight.w500),),
                            ],),
                            SizedBox(height: 25.h,),
                            Row(children: [
                              Text("Diseases",style: TextStyle(
                                  fontSize: 20.sp,fontWeight: FontWeight.bold),),
                              SizedBox(width: 120.w,),
                              Text("First\ndiscover",style: TextStyle(
                                  fontSize: 20.sp,fontWeight: FontWeight.bold),),
                            ],),

                            SizedBox(height: 20.h,),
                            Row(children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Atrioventricular\nblock	",style: TextStyle(
                                    fontSize: 20.sp,),),

                                  Text("Cardiomyopathy",style: TextStyle(
                                    fontSize: 20.sp,),),
                                  SizedBox(height: 5.h,),
                                  Text("Hypertension",style: TextStyle(
                                    fontSize: 20.sp,),),
                                ],
                              ),
                              SizedBox(width: 60.w,),
                              Column(
                                children: [
                                  Text("01/01/2022",style: TextStyle(
                                    fontSize: 20.sp,),
                                  ),
                                  SizedBox(height: 25.h,),
                                  Text("25/02/2023",style: TextStyle(
                                    fontSize: 20.sp,),
                                  ),
                                  SizedBox(height: 5.h,),
                                  Text("13/03/2023",style: TextStyle(
                                    fontSize: 20.sp,),
                                  ),
                                ],
                              ),
                            ],),
                            SizedBox(height: 10.h,),

                          ],),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {_launchUrl();
                            },
                            child: Text(
                              "See More",
                              style: TextStyle(color: Colors.white, fontSize: 18.sp),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.fromLTRB(65, 15, 65, 15)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(10, 156, 216, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ) ,
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
      ),
    );
  }
}
final Uri _url = Uri.parse('https://hebaaosama.github.io/medicalrecord/');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}