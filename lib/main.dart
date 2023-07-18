import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_windows/BussinessLogicLayer/Doctor/Editing/add_report_cubit.dart';
import 'package:new_windows/BussinessLogicLayer/Doctor/Registeration/update_profile_doc_cubit.dart';
import 'package:new_windows/BussinessLogicLayer/Doctor/Reservations/AcceptRefuse/accept_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BussinessLogicLayer/Doctor/Editing/update_medical_record_cubit.dart';
import 'BussinessLogicLayer/Doctor/Reservations/AcceptRefuse/refuse_cubit.dart';
import 'BussinessLogicLayer/Doctor/Reservations/reservations_cubit.dart';
import 'BussinessLogicLayer/Home/home_cubit.dart';
import 'BussinessLogicLayer/LogIn/login_cubit.dart';
import 'BussinessLogicLayer/MedicalReport/mrecord_cubit.dart';
import 'BussinessLogicLayer/Register/register_v2_cubit.dart';
import 'BussinessLogicLayer/Register/signup_cubit.dart';
import 'BussinessLogicLayer/UpdateProfile/updateprofile_cubit.dart';
import 'BussinessLogicLayer/user/get_user_cubit.dart';
import 'BussinessLogicLayer/user/reservation_cubit.dart';
import 'BussinessLogicLayer/user/user_reservation_report_cubit.dart';
import 'BussinessLogicLayer/user/userreservation_cubit.dart';
import 'PresentationLayer/Doctorapp/DoctorChat/DrChat.dart';
import 'PresentationLayer/Welcome/Welcome1.dart';
late SharedPreferences prefs;
Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>  AddReportCubit(),),
        BlocProvider(create: (context)=>  UpdateMedicalRecordCubit(),),
        BlocProvider(create: (context)=>  UpdateProfileDocCubit(),),
        BlocProvider(create: (context)=>  RefuseCubit(),),
        BlocProvider(create: (context)=>  AcceptCubit(),),
        BlocProvider(create: (context)=>  UserReservationReportCubit(),),
        BlocProvider(create: (context)=>  UserReservationCubit(),),
        BlocProvider(create: (context)=>  GetUserCubit(),),
        BlocProvider(create: (context)=>  ReservationsCubit(),),
        BlocProvider(create: (context)=>  HomeCubit(),),
        BlocProvider(create: (context) => ReservationCubit(),),
        BlocProvider(create: (context) => RegisterV2Cubit(),),
        BlocProvider(create: (context)=>  UpdateProfileCubit(),),
        BlocProvider(create: (context) => LoginCubit(),),
        BlocProvider(create: (context) => SignupCubit(),),
        BlocProvider(create: (context)=>  MrecordCubit(),),
      ],
      child: ScreenUtilInit(
        designSize:  Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
  builder: (context, state) {
      return MaterialApp(
        title: 'E-Healer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder()
          }),
          primarySwatch: Colors.blue,
         // useMaterial3: true,
        ),
        // home:MyReports(),
        home:Welcome1(),
      );
      },
      ),
    );
  }}
