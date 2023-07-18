import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../DataLayer/Models/User/UserReservationReportModel.dart';

import '../../BussinessLogicLayer/user/user_reservation_report_cubit.dart';
import 'BottomNav.dart';

class MyReports extends StatefulWidget {
  const MyReports({Key? key}) : super(key: key);

  @override
  State<MyReports> createState() => _MyReportsState();
}

class _MyReportsState extends State<MyReports> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => UserReservationReportCubit()..getUserReservationsReport(),
  child: Scaffold(
      body: Stack(
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
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => BottomNav()));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          )),
                    ),
                    Text(
                      "  My Reports",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 31.h,
                  ),
                  
                  Container(
                    height: MediaQuery.of(context).size.height*.75,
                    child: BlocBuilder<UserReservationReportCubit, UserReservationReportState>(
  builder: (context, state) {
    List<User>? user=
        UserReservationReportCubit.get(context).user ?? null;
    return ListView.builder(itemBuilder: (context,index)=>Container(
                      width: 335.w,
                      height: MediaQuery.of(context).size.height / 3,
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
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "My Report",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(user?[index].notes??'',
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),


                        ],
                      ),
                    ),itemCount: user?.length??0,);
  },
),
                  ),
                  
                  SizedBox(
                    height: 31.h,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) => const BottomNav()));
                    },
                    child: Text(
                      "OKAY",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
        ],
      ),
    ),
);
  }
}
