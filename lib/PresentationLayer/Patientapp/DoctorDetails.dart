import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/DataLayer/Models/home_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../BussinessLogicLayer/user/reservation_cubit.dart';
import 'BookDetails.dart';
import 'BottomNav.dart';
import 'MyDoctors.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key, required this.doctor}) : super(key: key);

  final Doctors doctor;
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  TextEditingController date = TextEditingController();
  TextEditingController notes = TextEditingController();

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
                                    builder: (context) => MyDoctors()));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          )),
                    ),
                    Text(
                      "  Doctor Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170.h,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 90.w,
                              height: 90.h,
                              child: Image.network(
                                  widget.doctor.certificate ?? ''),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Next Avilable",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Color.fromRGBO(10, 156, 216, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "12:00 Tomorrow",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Color.fromRGBO(
                                    76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "Dr.${widget.doctor.name ?? ''}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              widget.doctor.specializationName ?? '',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Color.fromRGBO(10, 156, 216, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "6 years expereince",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Color.fromRGBO(
                                    76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Color.fromRGBO(10, 156, 216, 1),
                                ),
                                Text(
                                  "  87%  ",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Color.fromRGBO(
                                        76, 82, 84, 0.7215686274509804),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Color.fromRGBO(10, 156, 216, 1),
                                ),
                                Text(
                                  "  69 Patient Stories",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Color.fromRGBO(
                                        76, 82, 84, 0.7215686274509804),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 338.w,
                    height: 150.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Service",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        ),
                        Row(
                          children: <Text>[
                            Text(
                              "1. ",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(10, 156, 216, 1),
                              ),
                            ),
                            Text(
                              "We Provide The best Patient Care",
                              style: TextStyle(
                                fontSize: 13.sp,
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
                        Row(
                          children: <Text>[
                            Text(
                              "2. ",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(10, 156, 216, 1),
                              ),
                            ),
                            Text(
                              "We care about your smile",
                              style: TextStyle(
                                fontSize: 13.sp,
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
                        Row(
                          children: <Text>[
                            Text(
                              "3. ",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(10, 156, 216, 1),
                              ),
                            ),
                            Text(
                              "If you Have an Emergency Come to us",
                              style: TextStyle(
                                fontSize: 13.sp,
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
                  Text(
                    "Appointment For",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromRGBO(10, 156, 216, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(10, 156, 216, 1),
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromRGBO(10, 156, 216, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: TextFormField(
                      controller: notes,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.edit),
                          labelText: "Notes",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(10, 156, 216, 1),
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromRGBO(10, 156, 216, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.r),
                      ),
                    ),
                    child: TextFormField(
                      controller: date,
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return "Invalid Date";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.edit),
                        labelText: "Date",
                        hintText: "DD MM YYYY",
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(10, 156, 216, 1),
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.r),
                          ),
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Color.fromRGBO(10, 156, 216, 1)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<ReservationCubit, ReservationState>(
                    listener: (context, state) {
                      if (state is ReservationFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            state.error,
                          ),
                          duration: Duration(
                            seconds: 3,
                          ),
                          backgroundColor: Colors.red,
                        ));
                      } else if (state is ReservationSuccess) {
                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: state.message ?? '',
                          desc: "Your Session Will be on ${state.user.date}",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Done",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              ),
                              onPressed: () => Navigator.pop(context),
                              width: 120.w,
                            )
                          ],
                        ).show();
                      }
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return state is ReservationLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : TextButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  ReservationCubit.get(context).reservation(
                                      notes: notes.text,
                                      date: date.text,
                                      doctor_id: widget.doctor.id.toString());
                                }
                              },
                              child: Text(
                                "Book ِAppointment",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.fromLTRB(0, 10, 0, 10)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(10, 156, 216, 1),
                                ),
                              ),
                            );
                    },
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
