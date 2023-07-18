import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../DataLayer/Models/User/UserReservationModel.dart';
import '../../BussinessLogicLayer/user/userreservation_cubit.dart';
import 'BottomNav.dart';


class MyReservations extends StatefulWidget {
  const MyReservations({Key? key}) : super(key: key);

  @override
  State<MyReservations> createState() => _MyReservationsState();
}

class _MyReservationsState extends State<MyReservations> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserReservationCubit()..getUserReservations(),
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
            SingleChildScrollView(
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
                  "  My Reservations",
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
                child: BlocBuilder<UserReservationCubit, UserReservationState>(
                    builder: (context, state) {
                      List<Userq>? user=
                          UserReservationCubit.get(context).user ?? null;
                      return ListView.builder(
                  scrollDirection: Axis.vertical,

                  itemBuilder:(context,index)=> Container(
                    width: 335.w,
                    height: 145.h,
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
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'You ',
                                style: TextStyle(
                                    color: Color.fromRGBO(10, 156, 216, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Made a reservation to',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp,
                                          color: Colors.black)),
                                ])),
                        SizedBox(height: 10.sp,),
                        RichText(
                            text: TextSpan(
                                text: 'Dr.${user?[index].doctorName??'n'}',
                                style: TextStyle(
                                    color: Color.fromRGBO(10, 156, 216, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '${user?[index].date??'nn'} at 10 AM',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.sp,
                                          color: Colors.black)),
                                ],),),
                        Text(user?[index].status??''.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                        itemCount: user?.length??1,
                );},),
              ),

              // Container(
              //   width: 335.w,
              //   height: 105.h,
              //   decoration: BoxDecoration(
              //     boxShadow: const [
              //       BoxShadow(
              //         blurRadius: 2,
              //         spreadRadius: 2,
              //         color: Color.fromARGB(20, 0, 0, 0),
              //       ),
              //     ],
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   padding: const EdgeInsets.all(20),
              //   margin: const EdgeInsets.all(10),
              //   child: Column(
              //
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       RichText(
              //           text: TextSpan(
              //               text: 'You ',
              //               style: TextStyle(
              //                   color: Color.fromRGBO(10, 156, 216, 1),
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 20.sp),
              //               children: <TextSpan>[
              //                 TextSpan(
              //                     text: 'Made a reservation to',
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.w500,
              //                         fontSize: 20.sp,
              //                         color: Colors.black)),
              //               ])),
              //       SizedBox(height: 10.sp,),
              //       RichText(
              //           text: TextSpan(
              //               text: 'Dr.Mossad on ',
              //               style: TextStyle(
              //                   color: Color.fromRGBO(10, 156, 216, 1),
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 20.sp),
              //               children: <TextSpan>[
              //                 TextSpan(
              //                     text: '2023-06-20 at 5 PM',
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.w500,
              //                         fontSize: 20.sp,
              //                         color: Colors.black)),
              //               ])),
              //       SizedBox(
              //         height: 10.h,
              //       ),
              //
              //     ],
              //   ),
              // ),
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
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
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
