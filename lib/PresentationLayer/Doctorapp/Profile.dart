import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/BussinessLogicLayer/LogIn/login_cubit.dart';

import '../../BussinessLogicLayer/user/get_user_cubit.dart';
import '../../DataLayer/Models/Register/LoginDoc.dart';
import '../../DataLayer/Models/User/GetUserModel.dart';

class ProfileDoctor extends StatefulWidget {
  const ProfileDoctor({Key? key}) : super(key: key);

  @override
  State<ProfileDoctor> createState() => _ProfileDoctorState();
}

class _ProfileDoctorState extends State<ProfileDoctor> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) =>GetUserCubit()..getGetUser(),
  child: Scaffold(
      body: Container(
        color: Colors.white,
        height: 926.h,
        width: 428.w,
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  // padding: EdgeInsets.all(20.0),
                  height:267.h,
                  width: MediaQuery.of(context).size.width * .99,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    ),
                    color: Color.fromRGBO(10, 156, 216, 1),
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
                              BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    User? userl=LoginCubit.get(context).user;
    return ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(                                  userl?.certificate??'https://th.bing.com/th/id/R.a463df1f4698fc59c7361cc89efe995c?rik=0tUGCJ%2bOuGIp8Q&pid=ImgRaw&r=0',

                                  width: 130.w,
                                  height: 130..h,
                                ),
                              );
  },
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
                            Text(
                              user?.address ?? '',
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
Container(
  height:648 ,width: 474,
  child: Image.network(user?.image??'https://th.bing.com/th/id/R.a463df1f4698fc59c7361cc89efe995c?rik=0tUGCJ%2bOuGIp8Q&pid=ImgRaw&r=0'),
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
    ),
);
  }
}
