
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/PresentationLayer/Doctorapp/Registeration/RegisterV2D.dart';
import 'package:new_windows/PresentationLayer/Doctorapp/Registeration/UpdateProfileD.dart';

import 'BottomNavD.dart';
class SettingsD extends StatefulWidget {
  const SettingsD({Key? key}) : super(key: key);

  @override
  State<SettingsD> createState() => _SettingsDState();
}

class _SettingsDState extends State<SettingsD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
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
        Container(
          child: Padding(padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children:<Widget>[
                  CircleAvatar(backgroundColor: Colors.white,child: IconButton(
                      onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute<void>(
                          builder: (context) => BottomNavD()));  },
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)
                  ),),
                  Text(
                    "  Settings",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                SizedBox(height: 31.h,),
                Text("Acoount Settings",style: TextStyle(
                  color: Color.fromRGBO(103, 114, 148, 1),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 16.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.red,child: Icon(Icons.lock,color: Colors.white,),),
                    Text(
                      "Change Password",style: TextStyle(
                      fontSize: 13.sp,
                      color: Color.fromRGBO(76, 82, 84, 0.7215686274509804),
                      fontWeight: FontWeight.w400,
                    ),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.4 ,),
                    Icon(
                      Icons.navigate_next,color: Color.fromRGBO(103, 114, 148, 1),),
                  ],),
                Divider(color: Colors.grey,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Color.fromRGBO(33, 150, 81, 1),child: Icon(Icons.edit_notifications,color: Colors.white,),),
                    Text(
                      "Notifications  ",style: TextStyle(
                      fontSize: 13.sp,
                      color: Color.fromRGBO(76, 82, 84, 0.7215686274509804),
                      fontWeight: FontWeight.w400,
                    ),),
                    SizedBox(width: MediaQuery.of(context).size.width*.4,),
                    Icon(Icons.navigate_next,color: Color.fromRGBO(103, 114, 148, 1),),
                  ],),
                Divider(color: Colors.grey,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Color.fromRGBO(86, 204, 242, 1),child: Icon(Icons.analytics,color: Colors.white,),),
                    Text(
                      "Statistics    ",style: TextStyle(
                      fontSize: 13.sp,
                      color: Color.fromRGBO(76, 82, 84, 0.7215686274509804),
                      fontWeight: FontWeight.w400,
                    ),),
                    SizedBox(width: MediaQuery.of(context).size.width*.4,),
                    Icon(Icons.navigate_next,color: Color.fromRGBO(103, 114, 148, 1),),
                  ],),
                Divider(color: Colors.grey,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Color.fromRGBO(10, 156, 216, 1),child: IconButton(
                      onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute<void>(
                          builder: (context) => UpdateProfileD()));  },
                      icon: Icon(Icons.edit, color: Colors.white,),
                    ),
                    ),
                    GestureDetector(onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute<void>(
                          builder: (context) => UpdateProfileD()));
                    },
                      child: Text(
                        "Update Profile  ",style: TextStyle(
                        fontSize: 13.sp,
                        color: Color.fromRGBO(76, 82, 84, 0.7215686274509804),
                        fontWeight: FontWeight.w400,
                      ),),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*.4,),
                    IconButton(
                      onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute<void>(
                          builder: (context) => UpdateProfileD()));  },
                      icon: Icon(Icons.navigate_next, color: Color.fromRGBO(103, 114, 148, 1),),
                    ),
                  ],),
                Divider(color: Colors.grey,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Color.fromRGBO(242, 153, 74, 1.0),child: Icon(Icons.people_alt,color: Colors.white,),),
                    Text(
                      "About Us      ",style: TextStyle(
                      fontSize: 13.sp,
                      color: Color.fromRGBO(76, 82, 84, 0.7215686274509804),
                      fontWeight: FontWeight.w400,
                    ),),
                    SizedBox(width: MediaQuery.of(context).size.width*.4,),
                    Icon(Icons.navigate_next,color: Color.fromRGBO(103, 114, 148, 1),),
                  ],),
                Divider(color: Colors.grey,),
                SizedBox(height: 27.h,),
                Text("More Options",style: TextStyle(
                  color: Color.fromRGBO(103, 114, 148, 1),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 10.h,),
                TextButton(
                  onPressed:(){
                    Navigator.pushReplacement(context, MaterialPageRoute<void>(
                        builder: (context) => const RegisterV2D()));
                  },
                  child:Text(
                    "Complete Profile",style: TextStyle(color: Colors.white,fontSize: 18.sp),),
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
              ],),
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

      ],),
    );
  }
}
