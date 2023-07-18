import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../BussinessLogicLayer/Home/home_cubit.dart';
import '../../DataLayer/Models/home_model.dart';

class FavoriteD extends StatefulWidget {
  const FavoriteD({Key? key}) : super(key: key);

  @override
  State<FavoriteD> createState() => _FavoriteDState();
}

class _FavoriteDState extends State<FavoriteD> {
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 41, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Text(
                        "Favourite Doctors",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 38.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                    height: MediaQuery.of(context).size.height,
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        HomeData? home=HomeCubit.get(context).homeData??null;
                        return Container(
                          height: 432.h,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
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
