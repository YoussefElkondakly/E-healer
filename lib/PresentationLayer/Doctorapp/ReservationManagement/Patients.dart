import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../BussinessLogicLayer/Doctor/Reservations/reservations_cubit.dart';
import '../../../DataLayer/Models/Doctor/ReservationsModel.dart';
import '../BottomNavD.dart';
import 'AddReport.dart';
import 'Patient_Medical_Record.dart';


class Patients extends StatefulWidget {
  const Patients({Key? key}) : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  @override
  Widget build(BuildContext context) {
    var _myController;
    return BlocProvider(
      create: (context) => ReservationsCubit()..getReservations(),
      child: Scaffold(
        body: Stack(
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
                      blurRadius: 143,
                      spreadRadius: 90,
                      //New
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 41, 5, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (context) => BottomNavD()));
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,10,0),
                        child: Text(
                          " Patients",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 38.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.search,
                        controller: _myController,
                        cursorColor: Color.fromRGBO(10, 156, 216, 1),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              _myController.clear();
                            },
                          ),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search....",
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
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      height: 700.h,
                      child: BlocBuilder<ReservationsCubit, ReservationsState>(
                        builder: (context, state) {
                          List<Userr>? users =
                              ReservationsCubit.get(context).allUsers;
                          return ListView.builder(
                            itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height *
                                  .2093596059 +
                                  55,
                              width: MediaQuery.of(context).size.width *
                                  .893333333333,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    color: Color.fromARGB(20, 0, 0, 0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child:Column(
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
                                        users[index].userName ?? '',
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
                                        users[index].date ?? '',
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
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.notes,
                                        color: Color.fromRGBO(10, 156, 216, 1.0),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        users[index].notes ?? 'No Notes Added',
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
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(
                                        Icons.north,
                                        color: Color.fromRGBO(10, 156, 216, 1.0),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        users[index].status ?? '',
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (context) =>
                                                  Patient_Medical_Record(patients: users[index],),),);
                                        },
                                        child: Text(
                                          "Edit Medical Record",overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp),
                                        ),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                          ),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(
                                            EdgeInsets.fromLTRB(
                                                28, 10, 28, 10),
                                          ),
                                          backgroundColor:
                                          MaterialStateProperty.all<
                                              Color>(
                                            Color.fromRGBO(10, 156, 216, 1),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20.w,),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (context) =>
                                                  AddReport(patients: users[index],),),);
                                        },
                                        child: Text(
                                          "Add Report",overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.sp),
                                        ),
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                          ),
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(
                                            EdgeInsets.fromLTRB(
                                                28, 10, 28, 10),
                                          ),
                                          backgroundColor:
                                          MaterialStateProperty.all<
                                              Color>(
                                            Color.fromRGBO(10, 156, 216, 1),
                                          ),
                                        ),
                                      ),
                                    ],),
                                ],
                              ),
                            ),
                            itemCount: users.length,
                          );
                        },
                      ),
                    ),
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
