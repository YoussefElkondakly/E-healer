import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'DoctorDetails.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({Key? key}) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(padding: EdgeInsets.fromLTRB(10, 40, 10,0),
            child:ListView(
              children:<Widget> [
                Row(children:<Widget>[
                  CircleAvatar(backgroundColor: Colors.white,child: IconButton(
                      onPressed: () {Navigator.pop(context);  },
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)
                  ),),
                  Text(
                    "  Appointment",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width:90.w,height: 90.h,child: Image.asset('assets/doc/aaaa.png'),),
                          SizedBox(height: 10.h,),
                          Text("Next Avilable",style: TextStyle(
                            fontSize: 13.sp,
                            color: Color.fromRGBO(10,156,216,1),
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 10.h,),
                          Text("12:00 Tomorrow",style: TextStyle(
                            fontSize: 13.sp,
                            color: Color.fromRGBO(76, 82, 84, 0.7215686274509804),
                            fontWeight: FontWeight.w400,
                          ),),
                        ],),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.h,),
                          Text(
                            "Dr.Youssef",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(height: 5.h,),

                          Text(
                            "Patheology Specialist",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Color.fromRGBO(10,156,216,1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5.h,),

                          Text(
                            "6 years expereince",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Color.fromRGBO(76, 82, 84, 0.7215686274509804),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5.h,),
                          Row(

                            children: <Widget>[
                              CircleAvatar(
                                radius: 3,backgroundColor: Color.fromRGBO(10,156,216,1),
                              ),
                              Text("  87%  ",style: TextStyle(
                                fontSize: 10.sp,
                                color: Color.fromRGBO(76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),),

                              CircleAvatar(
                                radius: 3,backgroundColor: Color.fromRGBO(10,156,216,1),
                              ),
                              Text("  69 Patient Stories",style: TextStyle(
                                fontSize: 10.sp,
                                color: Color.fromRGBO(76, 82, 84, 0.7215686274509804),
                                fontWeight: FontWeight.w400,
                              ),),

                            ],)

                        ],),
                      SizedBox(width: 10.w,),

                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                SizedBox(width: 338.w,child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                    Text(
                      "Appointment For",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:15.h,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(color: Colors.white,
                        border: Border.all(color: Color.fromRGBO(10, 156, 216, 1)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: TextFormField(
                        decoration:
                        InputDecoration(labelText: "Name",labelStyle: TextStyle(color: Color.fromRGBO(10, 156, 216, 1),fontWeight: FontWeight.w500,), border: InputBorder.none),
                      ),),
                    SizedBox(height: 10.h,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(color: Colors.white,
                        border: Border.all(color: Color.fromRGBO(10, 156, 216, 1)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: TextFormField(initialValue: "+20 ",

                        decoration:
                        InputDecoration(suffixIcon: Icon(Icons.edit),
                            labelText: "Contact Number",labelStyle: TextStyle(color: Color.fromRGBO(10, 156, 216, 1),fontWeight: FontWeight.w500,), border: InputBorder.none),
                      ),),
                    SizedBox(height: 10.h,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(color: Colors.white,
                        border: Border.all(color: Color.fromRGBO(10, 156, 216, 1)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: TextFormField(
                        decoration:
                        InputDecoration(suffixIcon: Icon(Icons.edit),
                            labelText: "Date",hintText: "DD MM YYYY",labelStyle: TextStyle(color: Color.fromRGBO(10, 156, 216, 1),fontWeight: FontWeight.w500,), border: InputBorder.none),
                      ),),
                  ],),),
                SizedBox(height: 115.h,),
                TextButton(
                  onPressed:(){
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Booked Successfully",
                      desc: "Your Session Will be tomorrow on 03:00 PM",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Done",
                            style: TextStyle(color: Colors.white, fontSize: 20.sp),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120.w,
                        )
                      ],
                    ).show();
                  },
                  child:Text(
                    "Book Now",style: TextStyle(color: Colors.white,fontSize: 18.sp),),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(0, 20, 0, 20)),
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(10, 156, 216, 1),),
                  ),
                ),
              ],
            ),
          ),
        ],),
    );
  }
}