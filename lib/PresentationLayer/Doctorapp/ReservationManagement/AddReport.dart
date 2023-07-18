import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../BussinessLogicLayer/Doctor/Editing/add_report_cubit.dart';
import '../../../DataLayer/Models/Doctor/ReservationsModel.dart';
import 'Patients.dart';

class AddReport extends StatefulWidget {
  const AddReport({Key? key, required this.patients}) : super(key: key);
  final Userr patients;
  @override
  State<AddReport> createState() => _AddReportState();
}
class _AddReportState extends State<AddReport> {
  var formkey = GlobalKey<FormState>();

  var notes = TextEditingController();
  TextEditingController date = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
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
                      blurRadius: 143.r,
                      spreadRadius: 90.r,
                      //New
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: ListView(
                children: <Widget>[
                  Row(children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => Patients()));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          )),
                    ),
                    Text(
                      "  Patient Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 115.h,
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
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: Color.fromRGBO(10, 156, 216, 1.0),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              textAlign:TextAlign.start,
                              widget.patients.userName ?? '',
                              style: TextStyle(
                                fontSize: 17.sp,
                              ),
                            ),


                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.calendar_month,
                              color: Color.fromRGBO(10, 156, 216, 1.0),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              widget.patients.date ?? '',
                              style: TextStyle(
                                fontSize: 17.sp,
                                color: Color.fromRGBO(
                                    76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),
                            ),


                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Report For ${widget.patients.userName ?? ''}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Container(
                            width: 375.w,
                            height: 300.h,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Text(
                                  '  Notes',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      height: 1.5),
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
                                        fontSize: 15,
                                        height: 1.5),
                                    suffixIcon: Icon(Icons.edit),
                                  ),
                                ),
                                Text("  Type of Report",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        height: 3)),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Icon(Icons.insert_drive_file_rounded,
                                        color: Color.fromRGBO(10, 156, 216, 1)),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Icon(Icons.insert_page_break_outlined,
                                        color: Color.fromRGBO(10, 156, 216, 1)),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Icon(Icons.insert_chart,
                                        color: Color.fromRGBO(10, 156, 216, 1)),
                                    SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '  Report created on ${widget.patients.date}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      height: 1.5),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 270.w,
                                    height: 54.h,
                                    child: BlocConsumer<
                                        AddReportCubit,
                                        AddReportState>(
                                      listener: (context, state) {
                                        if (state
                                        is AddReportFailed) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              state.error??'',
                                            ),
                                            duration: Duration(
                                              seconds: 3,
                                            ),

                                          ));
                                        } else if (state
                                        is AddReportSuccess) {
                                          Alert(
                                            context: context,
                                            type: AlertType.success,
                                            title: state.message ?? '',
                                            desc:
                                            "You Updated Report for ${state.report?.userId.toString()}",
                                            buttons: [
                                              DialogButton(
                                                child: Text(
                                                  "Done",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.sp),
                                                ),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                width: 120.w,
                                              )
                                            ],
                                          ).show();
                                        }
                                      },
                                      builder: (context, state) {
                                        return state
                                        is AddReportLoading
                                            ? Center(
                                          child:
                                          CircularProgressIndicator(),
                                        )
                                            : TextButton(
                                          onPressed: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              AddReportCubit
                                                  .get(context)
                                                  .addReport(
                                                  reservation_id: widget.patients.id.toString(),
                                                  notes: notes.text);
                                            }
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Add Record",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          style: ButtonStyle(
                                            shape:
                                            MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10),
                                              ),
                                            ),
                                            backgroundColor:
                                            MaterialStateProperty.all<
                                                Color>(
                                              Color.fromRGBO(
                                                  10, 156, 216, 1),
                                            ),
                                          ),
                                        );
                                        ;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
