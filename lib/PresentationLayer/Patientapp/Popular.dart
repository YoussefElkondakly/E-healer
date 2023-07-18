import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../BussinessLogicLayer/Home/home_cubit.dart';
import '../../DataLayer/Models/home_model.dart';
import 'BottomNav.dart';
class PopularDocs extends StatefulWidget {
  const PopularDocs({Key? key}) : super(key: key);

  @override
  State<PopularDocs> createState() => _PopularDocsState();
}

class _PopularDocsState extends State<PopularDocs> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHome(),
      child: Scaffold(

        body: Container(
          child: LayoutBuilder(builder: (context, constraint) {
            return Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  /*دي الدايرة المتشبحنه اللي فوق*/
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
                  SingleChildScrollView(child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(children:[
                              IconButton(
                                  onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute<void>(
                                      builder: (context) => BottomNav()));  },
                                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)
                              ),
                              Text(
                                "Popular Doctors",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),


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
                      SizedBox(
                        height: 22.h,
                      ),
/*-------------------------------------------------------------------*/
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          HomeData? home=HomeCubit.get(context).homeData??null;
                          return Container(
                            height: 220.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>  Container(
                                width: 136.w,
                                height: 200.h,
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
                                    Image.network(home?.doctors?[index].certificate??'' ,errorBuilder: (context, error, stackTrace) => Image.asset("assets/welcome/img_1.png"),fit: BoxFit.fill,width: 136.w,height: 131.h,),
                                    Text(overflow: TextOverflow.ellipsis,
                                      "Dr.${home?.doctors?[index].name??''}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      home?.doctors?[index].specializationName??'',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Color.fromRGBO(103, 114, 148, 1),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Row(
                                      /*The stars*/
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Color.fromRGBO(249, 190, 19, 1),
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color.fromRGBO(249, 190, 19, 1),
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color.fromRGBO(249, 190, 19, 1),
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color.fromRGBO(249, 190, 19, 1),
                                          size: 15,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color.fromRGBO(249, 190, 19, 1),
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),itemCount:home?.doctors?.length??0 ,),
                          );
                        },
                      ),

                      Row(children: [SizedBox(width: 20.w,),
                        Text(
                          "Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),],),
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          HomeData? home=HomeCubit.get(context).homeData??null;
                          return Container(
                            height: 432.h,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) =>  Container(
                                width: 335.w,
                                height: 104.h,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Image.network(home?.doctors?[index].certificate??''),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(),
                                            SizedBox(width: 135.w,
                                              child: Text(overflow:TextOverflow.ellipsis,
                                                "Dr.${home?.doctors?[index].name??''}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              home?.doctors?[index].specializationName??'',
                                              style: TextStyle(
                                                fontSize: 14.sp,
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
                                            SizedBox(),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        SizedBox(height: 45.h,),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children:  <Widget>[
                                            Text(
                                              "2.4 ",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "(2475 views)",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ],
                                ),

                              ),itemCount:home?.doctors?.length??0 ,),
                          );
                        },
                      ),

                    ],
                  ),),

                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

