import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Doctor.dart';
import 'Patient.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  TextEditingController mail = TextEditingController();
  TextEditingController Password = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool ispass = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                      color: Color.fromRGBO(97, 206, 255, 0.30196078431372547),
                      blurRadius: 143,
                      spreadRadius: 90,
                      //New
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 72.h,
                    ),
                    Text(
                      "Join Us To Start",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "If you don’t take care of your health.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "We will !",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 70.h,
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: Color.fromRGBO(10, 156, 216, 1),
                        indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 17),
                        labelStyle: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                        labelColor: Color.fromRGBO(10, 156, 216, 1),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.bold),
                        unselectedLabelColor: Colors.black,
                        tabs: const <Widget>[
                          Tab(
                            text: "Patient",
                          ),
                          Tab(text: "Doctor"),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 651.h,
                      child: TabBarView(
                        controller: _tabController,
                        children: const <Widget>[
                          Patient(),
                          Doctor(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*دي الدايرة المتشبحنه اللي تحت*/
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
          ],
        ),
      ),
    );
  }
}
