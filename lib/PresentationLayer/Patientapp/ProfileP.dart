import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../BussinessLogicLayer/user/get_user_cubit.dart';
import '../../DataLayer/Models/User/GetUserModel.dart';

class ProfileP extends StatefulWidget {
  const ProfileP({Key? key}) : super(key: key);

  @override
  State<ProfileP> createState() => _ProfilePState();
}

class _ProfilePState extends State<ProfileP> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserCubit()..getGetUser(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 267.h,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color.fromRGBO(10, 156, 216, 1.0),
                            Color.fromRGBO(11, 134, 184, 1.0),
                          ]),
                      color: Color.fromRGBO(10, 156, 216, 1.0),
                      borderRadius: BorderRadius.circular(20)),
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
              BlocBuilder<GetUserCubit, GetUserState>(
                builder: (context, state) {
                  Userg? user = GetUserCubit.get(context).user ?? null;
                  return Padding(
                    padding: EdgeInsets.fromLTRB(20, 41, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  user?.image??'https://th.bing.com/th/id/R.a463df1f4698fc59c7361cc89efe995c?rik=0tUGCJ%2bOuGIp8Q&pid=ImgRaw&r=0',
                                  width: 130.w,
                                  height: 130..h,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                 "Personal information",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),

                        SizedBox(
                          height: 12.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(10, 156, 216, 1.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              user?.name ?? '',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Color.fromRGBO(
                                    76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(10, 156, 216, 1.0),
                              child: Icon(
                                Icons.alternate_email,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              user?.email ?? '',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Color.fromRGBO(
                                    76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(10, 156, 216, 1.0),
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              user?.mobile ?? '',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Color.fromRGBO(
                                    76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(10, 156, 216, 1.0),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width:250.w,
                              child: Text(
                                user?.address ?? '',
                                overflow:TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Color.fromRGBO(
                                      76, 82, 84, 0.7215686274509804),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(10, 156, 216, 1.0),
                              child: Icon(
                                Icons.cake,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              user?.birthdate ?? '',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Color.fromRGBO(
                                    76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(10, 156, 216, 1.0),
                              child: Icon(
                                Icons.cake,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${user?.age.toString() ?? ''} Years",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Color.fromRGBO(
                                    76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(10, 156, 216, 1.0),
                              child: Icon(
                                Icons.contact_emergency,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              user?.emergencyMobile ?? '',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Color.fromRGBO(
                                    76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),

                        SizedBox(
                          height: 32.h,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
