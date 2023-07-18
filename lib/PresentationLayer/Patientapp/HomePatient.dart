import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/PresentationLayer/ChatBot/ChatBot_finally.dart';
import '../../../DataLayer/Models/Register/LoginDoc.dart';
import '../../BussinessLogicLayer/Home/home_cubit.dart';

import '../../BussinessLogicLayer/LogIn/login_cubit.dart';
import '../../DataLayer/Models/home_model.dart';

import 'MyDoctors.dart';
import 'Popular.dart';

class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> {
  TextEditingController _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHome(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              /*دايرة شبح*/
              Positioned(
                left: -102,
                top: 148,
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
                        spreadRadius: 20,
                        //New
                      )
                    ],
                  ),
                ),
              ),
              /*الAppBar*/
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 165.h,
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
              //---------------------------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      final User? user = LoginCubit.get(context).user ?? null;

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 40.h,
                              ),
                              Container(
                                width: 50.w,
                                height: 50.h,

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child:ClipRRect(
                                  borderRadius:BorderRadius.circular(100),
                                  child: Image.network(user?.image??'',width: 130.w,height: 130..h,fit: BoxFit.fill,),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                "Hi ${user?.name ?? ''}!",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Find Your Doctor",
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 35, 20, 37),
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
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      "How Can We Help ?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => const ChatBot_final()));
                          },
                          child: Text(
                            "Check Symptoms",
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
                                EdgeInsets.fromLTRB(65, 15, 65, 15)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(10, 156, 216, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => const MyDoctors()));
                          },
                          child: Text(
                            "Book Appointment",
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
                                EdgeInsets.fromLTRB(59, 15, 59, 15)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(10, 156, 216, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 0.w,
                            ),
                            Container(
                              width: 80.w,
                              height: 90.h,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color.fromRGBO(15, 53, 203, 1.0),
                                      Color.fromRGBO(66, 120, 255, 1.0),
                                    ],
                                  ),
                                  color: Color.fromRGBO(37, 150, 190, 1.0),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(
                                'assets/welcome/tooth.png',
                              ),
                            ),
                            Container(
                              width: 80.w,
                              height: 90.h,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.blue,
                                      Color.fromRGBO(75, 201, 239, 1.0),
                                    ],
                                  ),
                                  color: Color.fromRGBO(10, 156, 216, 1.0),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(
                                'assets/welcome/cardiac.png',
                              ),
                            ),
                            Container(
                              width: 80.w,
                              height: 90.h,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color.fromRGBO(254, 127, 68, 1),
                                      Color.fromRGBO(255, 207, 104, 1.0),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(
                                'assets/welcome/view.png',
                              ),
                            ),
                            Container(
                              width: 80.w,
                              height: 90.h,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color.fromRGBO(255, 72, 76, 1.0),
                                      Color.fromRGBO(255, 108, 96, 1.0),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(
                                'assets/welcome/slim-body.png',
                              ),
                            ),
                            SizedBox(
                              width: 0.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Popular Doctors",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (context) =>
                                          const PopularDocs()));
                                },
                                child: Text(
                                  "See all>",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color.fromRGBO(103, 114, 148, 1),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            HomeData? home=HomeCubit.get(context).homeData??null;
                            return Container(
                              height: 290.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>  Container(
                                  width: 195.w,
                                  height: 290.h,
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
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Image.network(home?.doctors?[index].certificate??'',
                                        errorBuilder: (context, error, stackTrace) => Image.asset("assets/welcome/img_1.png"),fit: BoxFit.fill,width: 190.w,height: 180.h,),
                                      Text(
                                        "Dr. ${home?.doctors?[index].name??''}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.sp,
                                        ),
                                      ),
                                      Text(
                                        home?.doctors?[index].specializationName??'',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Color.fromRGBO(
                                              103, 114, 148, 1),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Row(
                                        /*The stars*/
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: const <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Color.fromRGBO(
                                                249, 190, 19, 1),
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color.fromRGBO(
                                                249, 190, 19, 1),
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color.fromRGBO(
                                                249, 190, 19, 1),
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color.fromRGBO(
                                                249, 190, 19, 1),
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color.fromRGBO(
                                                249, 190, 19, 1),
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                itemCount:home?.doctors?.length??0 ,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
