
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Registeration/Login.dart';
import 'Welcome2.dart';


class Welcome1 extends StatefulWidget {
  const Welcome1({Key? key}) : super(key: key);

  @override
  State<Welcome1> createState() => _Welcome1State();
}

class _Welcome1State extends State<Welcome1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          child: LayoutBuilder(
              builder: (context, constraint) {
                return


                  Center(child: Stack(
        children: <Widget>[
          Positioned(left: -104,
            top: -20,
            child: Container(
              width:342.w ,
              height: 342.h,
              decoration: BoxDecoration(shape:BoxShape.circle,color:Color.fromRGBO(10, 156, 216, 1),),


            ),

          ),
          Positioned(left: 20,right: 19,
            top: 91,
            child: Container(
              width:336.w ,
              height: 336.h,
              decoration: BoxDecoration(shape:BoxShape.circle,
                color:Color.fromRGBO(10, 156, 216, 1),
                image: DecorationImage(
                  image: AssetImage(
                  'assets/welcome/img.png'),
                fit: BoxFit.fill,
              ),
              ),
            ),

            ),
          Positioned(top:511 ,
            left: 20,
            right: 20,
            child: Column(
            children:<Widget> [
              Text("Find Trusted Doctors",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30.sp,letterSpacing: .3),),
            SizedBox(height: 11.h,),
              Text(
                "We Have The Best Verified Doctors\n All Over Egypt ",

                textAlign:TextAlign.center,
                style: TextStyle(height: 1.656,
                  fontWeight: FontWeight.w400,fontSize: 14.sp,color: Color.fromRGBO(103, 114, 148, 1),),
              ),
              SizedBox(height:53.h,),
              TextButton(
                onPressed:(){
                Navigator.pushReplacement(context, MaterialPageRoute<void>(
                    builder: (context) => const Welcome2()));
              },
                child:Text(
                  "Next",style: TextStyle(color: Colors.white,fontSize: 18.sp),),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(115, 15, 115, 15)),
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(10, 156, 216, 1),),
              ),
              ),
              SizedBox(height:8.h,),
              GestureDetector(onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute<void>(
                    builder: (context) => const Login()));
              },
              child: Text("Skip",style: TextStyle(fontSize: 14.sp,color: Color.fromRGBO(103, 114, 148, 1),fontWeight: FontWeight.w400,decoration: TextDecoration.underline),),
              ),
            ],
          ),),

        ],
      ),
        );})),
    );
  }
}
