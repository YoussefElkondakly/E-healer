import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/BussinessLogicLayer/Home/home_cubit.dart';

import '../../DataLayer/Models/home_model.dart';
import 'BottomNav.dart';
import 'DoctorDetails.dart';

class MyDoctors extends StatefulWidget {
  const MyDoctors({Key? key}) : super(key: key);

  @override
  State<MyDoctors> createState() => _MyDoctorsState();
}

class _MyDoctorsState extends State<MyDoctors> {

  @override

  Widget build(BuildContext context) {
    var _myController;
    return BlocProvider(
      create: (context) => HomeCubit()..getHome(),
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
            SingleChildScrollView(
              child: Center(
                child:  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
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
                                  "  My Doctors",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Container(
                              // padding: EdgeInsets.fromLTRB(20, 35, 20, 37),
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
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:MediaQuery.of(context).size.height*.75,
                        child: BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            HomeData? home = HomeCubit.get(context).homeData ?? null;
                            return Container(height:MediaQuery.of(context).size.height,
                              child:
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) => Container(
                                  width: 335.w,
                                  height: 170.h,
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 90.w,
                                            height: 90.h,
                                            child: Image.network(home?.doctors?[index].certificate??'',
                                              errorBuilder: (context, error, stackTrace) => Image.asset("assets/welcome/img_1.png"),fit: BoxFit.fill,width: 92.w,height: 87.h,),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            "Next Avilable",
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: Color.fromRGBO(10, 156, 216, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            "12:00 Tomorrow",
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: Color.fromRGBO(
                                                  76, 82, 84, 0.7215686274509804),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          SizedBox(width: 130.w,
                                            child: Text(overflow:TextOverflow.ellipsis,
                                              "Dr.${home?.doctors?[index].name??''}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            home?.doctors?[index].specializationName??'',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: Color.fromRGBO(10, 156, 216, 1),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            "6 years expereince",
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: Color.fromRGBO(
                                                  76, 82, 84, 0.7215686274509804),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              CircleAvatar(
                                                radius: 3,
                                                backgroundColor:
                                                    Color.fromRGBO(10, 156, 216, 1),
                                              ),
                                              Text(
                                                "  87%  ",
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Color.fromRGBO(
                                                      76, 82, 84, 0.7215686274509804),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              CircleAvatar(
                                                radius: 3,
                                                backgroundColor:
                                                    Color.fromRGBO(10, 156, 216, 1),
                                              ),
                                              Text(
                                                "  69 Patient Stories",
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Color.fromRGBO(
                                                      76, 82, 84, 0.7215686274509804),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute<void>(
                                                      builder: (context) =>
                                                           DoctorDetails(doctor: home!.doctors![index],),),);
                                            },
                                            child: Text(
                                              "Book Now",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              padding: MaterialStateProperty.all<
                                                      EdgeInsets>(
                                                  EdgeInsets.fromLTRB(28, 10, 28, 10)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(
                                                Color.fromRGBO(10, 156, 216, 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                itemCount: home?.doctors?.length ?? 0,
                              ),
                            );
                          },
                        ),
                      ),
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
