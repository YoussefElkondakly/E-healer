import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/BussinessLogicLayer/Doctor/Reservations/AcceptRefuse/accept_cubit.dart';
import 'package:new_windows/BussinessLogicLayer/Doctor/Reservations/AcceptRefuse/refuse_cubit.dart';
import 'package:new_windows/BussinessLogicLayer/Doctor/Reservations/reservations_cubit.dart';
import 'package:new_windows/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../../DataLayer/Models/Doctor/ReservationsModel.dart';
import '../BottomNavD.dart';
class UpComing extends StatefulWidget {
  const UpComing({Key? key}) : super(key: key);

  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationsCubit()..getReservations(),
      child: Scaffold(
        body: Container(
          height: 812.h,
          width: double.infinity,
          child: SingleChildScrollView(
            child: BlocConsumer<AcceptCubit, AcceptState>(
              listener: (context, state) {
                if (state is AcceptFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      state.error,
                    ),
                    duration: Duration(
                      seconds: 3,
                    ),
                    backgroundColor: Colors.red,
                  ));
                } else if (state is AcceptSuccess) {
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: state.message ?? '',
                    // desc: state.message ?? '',
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Okay",
                          style: TextStyle(
                              color: Colors.white, fontSize: 20.sp),
                        ),
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => BottomNavD())),
                        width: 120.w,
                      )
                    ],
                  ).show();
                }
              },
              builder: (context, state) {
                return BlocConsumer<RefuseCubit, RefuseState>(
                  listener: (context, state) {
                    if (state is RefuseFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          state.error,
                        ),
                        duration: Duration(
                          seconds: 3,
                        ),
                        backgroundColor: Colors.red,
                      ));
                    } else if (state is RefuseSuccess) {
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: state.message ?? '',
                        // desc: state.message ?? '',
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Okay",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.sp),
                            ),
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => BottomNavD())),
                            width: 120.w,
                          )
                        ],
                      ).show();
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      height: MediaQuery.of(context).size.height * .75,
                      child:
                      BlocBuilder<ReservationsCubit, ReservationsState>(
                        builder: (context, state) {
                          List<Userr>? users =
                              ReservationsCubit.get(context).hold;
                          return users.isEmpty?
                          Center(child: Text('no reservation'),)
                              :ListView.builder(
                            physics:OneScroll,
                            padding: EdgeInsets.only(left: 10,right: 10,top: 8),
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
                                children: <Widget>[
                                  //Image

                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      //data
                                      RichText(
                                          text: TextSpan(
                                              text:
                                              '${users[index].userName} ' ??
                                                  '',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      10, 156, 216, 1),
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize: 13.sp),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text:
                                                    'sent a reservation on ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 13.sp,
                                                        color: Colors.black)),
                                              ])),
                                      RichText(
                                          text: TextSpan(
                                              text:
                                              '${users?[index].date ?? ''} ',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      10, 156, 216, 1),
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize: 13.sp),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: users?[index].notes??'No Notes',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 13.sp,
                                                        color: Colors.black)),
                                              ])),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      //buttons
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 30.h,
                                            width: 74.w,
                                            child: TextButton(
                                              onPressed: () {
                                                AcceptCubit.get(context)
                                                    .getAccept(
                                                    id: users?[index]
                                                        .id
                                                        .toString() ??
                                                        '');
                                                print("Done");
                                              },
                                              child: Text(
                                                "Accept",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              style: ButtonStyle(
                                                shape: MaterialStateProperty
                                                    .all<
                                                    RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(4),
                                                  ),
                                                ),
                                                backgroundColor:
                                                MaterialStateProperty
                                                    .all<Color>(
                                                  Color.fromRGBO(
                                                      10, 156, 216, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          SizedBox(
                                            height: 30.h,
                                            width: 74.w,
                                            child: TextButton(
                                              onPressed: () {
                                                RefuseCubit.get(context)
                                                    .getRefuse(
                                                    id: users?[index]
                                                        .id
                                                        .toString() ??
                                                        '');
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              style: ButtonStyle(
                                                shape: MaterialStateProperty
                                                    .all<
                                                    RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(4),
                                                  ),
                                                ),
                                                backgroundColor:
                                                MaterialStateProperty
                                                    .all<Color>(
                                                  Color.fromRGBO(
                                                      234, 6, 6, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
