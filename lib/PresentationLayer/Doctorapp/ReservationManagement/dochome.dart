import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/BussinessLogicLayer/Doctor/Reservations/reservations_cubit.dart';
import 'package:new_windows/PresentationLayer/Doctorapp/ReservationManagement/Patients.dart';
import '../../../BussinessLogicLayer/LogIn/login_cubit.dart';
import '../../../DataLayer/Models/Doctor/ReservationsModel.dart';
import '../../../DataLayer/Models/Register/LoginDoc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationsCubit()..getReservations(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                        color:
                            Color.fromRGBO(10, 156, 216, 0.30196078431372547),
                        blurRadius: 143,
                        spreadRadius: 90,
                        //New
                      )
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 156.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Color.fromRGBO(10, 156, 216, 1),
                    ),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        final User? user = LoginCubit.get(context).user ?? null;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Dr.${user?.name ?? ''}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: 60.h,
                                width: 60.w,
                                margin: EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black38,
                                ),
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(48),
                                    child: Image.network(
                                      user?.certificate ?? '',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      "Schedule",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 010, 0),
                    height: 550.h,
                    child: BlocBuilder<ReservationsCubit, ReservationsState>(
                      builder: (context, state) {
                        List<Userr>? users =
                            ReservationsCubit.get(context).allUsers;
                        return ListView.builder(
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            height: 240.h,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute<void>(
                                              builder: (context) =>
                                                  const Patients()));
                                    },
                                    child: Text(
                                      "View History",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.sp),
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets.fromLTRB(28, 10, 28, 10),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(10, 156, 216, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          itemCount: users.length ?? 0,
                        );
                      },
                    ),
                  ),
                ],
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
                        color:
                            Color.fromRGBO(10, 156, 216, 0.30196078431372547),
                        blurRadius: 143,
                        spreadRadius: 90,
                        //New
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
