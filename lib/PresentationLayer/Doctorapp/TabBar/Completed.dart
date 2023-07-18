import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../BussinessLogicLayer/Doctor/Reservations/reservations_cubit.dart';
import '../../../DataLayer/Models/Doctor/ReservationsModel.dart';
import '../../../constants.dart';

class Completed extends StatefulWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationsCubit()..getReservations(),
      child: Scaffold(
        body: Container(
          height: 812..h,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * .75,
              child: BlocBuilder<ReservationsCubit, ReservationsState>(
                builder: (context, state) {
                  List<Userr>? users =
                      ReservationsCubit.get(context).accept;
                  return ListView.builder(
                    physics:OneScroll,
                    padding: EdgeInsets.only(left: 10,right: 10,top: 8,),
                    itemBuilder: (context, index) => Container(
                      height: 111.h,
                      width: 335.w,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: Color.fromARGB(20, 0, 0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: '${users?[index].userName??''} ',
                                  style: TextStyle(
                                    color: Color.fromRGBO(10, 156, 216, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'completed the medical ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'examine with you At ${users?[index].date} ',
                                  style: TextStyle(
                                      color: Color.fromRGBO(10, 156, 216, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'at 10am',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    itemCount: users.length ?? 0,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
