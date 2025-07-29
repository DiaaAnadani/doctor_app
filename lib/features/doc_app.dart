import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //خاصية تحديد حجم الشاشة  للتصميم تاتي من مصمم الواجهة الذي يعطي التصميم 
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Doc App'.toUpperCase(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor:ColorsManager.mainBlue,
        scaffoldBackgroundColor: Colors.white,),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
        ),
    );
  }
}
