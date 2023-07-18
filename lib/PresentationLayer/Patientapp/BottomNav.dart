import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/PresentationLayer/ChatBot/ChatBot_finally.dart';
import 'package:new_windows/PresentationLayer/Patientapp/MyReports.dart';
import 'package:new_windows/PresentationLayer/Patientapp/MyReservations.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../BussinessLogicLayer/LogIn/login_cubit.dart';
import '../../DataLayer/Models/Register/LoginDoc.dart';
import '../CommonBetween/Helpp.dart';
import '../CommonBetween/TermsOfServicep.dart';
import '../Registeration/Login.dart';

import 'FavoriteD.dart';
import 'HomePatient.dart';
import 'Popular.dart';
import 'ProfileP.dart';
import 'Settings.dart';
import 'medical_record.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  List SliderClasses = [
    HomeP(),
    FavoriteD(),
    ChatBot_final(),
    ProfileP(),
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
                            child: Image.network(user?.image ??
                                'https://kennyleeholmes.com/wp-content/uploads/2017/09/no-image-available.png'),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent),
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
                                user?.name ?? '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                user?.mobile ?? '',
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
                        height: MediaQuery.of(context).size.height *
                            .1995073891625616,
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
                            hintText: "My Doctors",
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
                                    builder: (context) => const PopularDocs()));
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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) =>
                                        const medical_record()));
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
                              Icons.person,
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                            hintText: "Patient Details",
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
                                    builder: (context) => const ProfileP()));
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
                                    builder: (context) => const Helpp()));
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
                                    builder: (context) => const Settings()));
                          },
                        ),
                      ),
                      //-----------------
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
                              Icons.file_open,
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                            hintText: "My Reservations",
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
                                    builder: (context) => const MyReservations()));
                          },
                        ),
                      ),
                      //------------------
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
                              Icons.receipt,
                              color: Colors.white,
                            ),
                            suffixIcon: Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                            hintText: "My Reports",
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
                                    builder: (context) => const MyReports()));
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
                                            builder: (context) =>
                                                const Login())),
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
                                            builder: (context) =>
                                                const Login())),
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
      body: SliderClasses[currentIndex],
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
                Icons.favorite,
              ),
              label: "Favorite",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.textsms,
              ),
              label: "Chat Bot",
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
