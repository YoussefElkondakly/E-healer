import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/PresentationLayer/Doctorapp/SettingsD.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../BussinessLogicLayer/LogIn/login_cubit.dart';
import '../../DataLayer/Models/Register/LoginDoc.dart';
import '../CommonBetween/Helpp.dart';
import '../CommonBetween/TermsOfServicep.dart';
import '../CommonBetween/doc/Help.dart';
import '../Registeration/Login.dart';

import 'Chat.dart';

import 'DoctorChat/DrChat.dart';
import 'ReservationManagement/Patients.dart';

import 'Profile.dart';

import 'TabBar/TabBarNotifications.dart';
import 'ReservationManagement/dochome.dart';

class BottomNavD extends StatefulWidget {
  const BottomNavD({Key? key}) : super(key: key);

  @override
  State<BottomNavD> createState() => _BottomNavDState();
}

class _BottomNavDState extends State<BottomNavD> {
  int currentIndex = 0;
  List SliderClasses = [
    Home(),
    TabBarNotification(),
    DrChat(),
    ProfileDoctor(),
  ];
  void tapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).size.width * .25,
      body: SliderClasses[currentIndex],
      drawer: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final User? user = LoginCubit.get(context).user ?? null;
          return Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(10, 156, 216, 1),
                Color.fromRGBO(14, 90, 131, 1.0),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(user?.certificate??''),),
                            shape: BoxShape.circle, ),
                        width: 44.w,
                        height: 44.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Dr.${user?.name??''}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "+2${user?.mobile??''}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                          ),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height * .1995073891625616,
                  ),
                  SizedBox(
                    width: 226.w,
                    height: 61.h,
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                        hintText: "My Patients",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => const Patients()));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 226.w,
                    height: 61.h,
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.assignment,
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                        hintText: "Medical Records",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context,
                          );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 226.w,
                    height: 61.h,
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.assignment,
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                        hintText: "Privacy&Policy",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => const terms()));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 226.w,
                    height: 61.h,
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.help,
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                        hintText: "Help Center",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => const Help()));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 226.w,
                    height: 61.h,
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ),
                        hintText: "Settings",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) => const SettingsD()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title: "LogOut",
                            desc: "Are you Sure you Want to go ?",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                                onPressed: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (context) => const Login())),
                                width: 120.w,
                              ),
                              DialogButton(
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120.w,
                              ),
                            ],
                          ).show();
                        },
                        child: Text(
                          "LogOut",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      IconButton(
                        onPressed: () {
                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title: "LogOut",
                            desc: "Are you Sure you Want to go ? 🥺",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                                onPressed: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (context) => const Login())),
                                width: 120.w,
                              ),
                              DialogButton(
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.sp),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120.w,
                              ),
                            ],
                          ).show();
                        },
                        icon: Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(10, 156, 216, 1),
        elevation: 10,
      );
  },
),
      bottomNavigationBar: BottomNavigationBar(
        onTap: tapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.house,
              ),
              label: "Home",
              backgroundColor: Color.fromRGBO(10, 156, 216, 1.0)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: "Notifications",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.textsms,
              ),
              label: "Chats",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Profile",
              backgroundColor: Colors.blue),
        ],
        currentIndex: currentIndex,
        elevation: 200,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white12,
        selectedItemColor: Color.fromRGBO(10, 156, 216, 1),
        unselectedItemColor: Color.fromRGBO(133, 142, 169, 1),
        selectedFontSize: 15.sp,
        unselectedFontSize: 12.sp,
      ),
    );
  }
}
