import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'UpComing.dart';
import 'Completed.dart';
import 'Cancelled.dart';



class TabBarNotification extends StatefulWidget {
  const TabBarNotification({super.key});

  @override
  State<TabBarNotification> createState() => _TabBarNotificationState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
///
class _TabBarNotificationState extends State<TabBarNotification>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(26, 30, 0, 0),
                    child: Text(
                      "Notification",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 70.h,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Color.fromRGBO(10, 156, 216, 1),
                      indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 17),
                      labelStyle:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      labelColor: Color.fromRGBO(10, 156, 216, 1),
                      unselectedLabelStyle:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      unselectedLabelColor: Colors.black,
                      tabs: const <Widget>[
                        Tab(
                          text: "UpComing",
                        ),
                        Tab(text: "Completed"),
                        Tab(text: "Canceld"),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 651.h,
                    child: TabBarView(
                      controller: _tabController,
                      children: const <Widget>[
                        UpComing(),
                        Completed(),
                        Cancelled(),
                      ],
                    ),
                  ),
                ],
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
