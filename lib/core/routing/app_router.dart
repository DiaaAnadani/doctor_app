import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      //   //loginScreen
      // case Routes.loginScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (context) => getIt<LoginCubit>(),
      //             child: const LogInScreen(),
      //           ));

      //    //signUpScreen
      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (context) => getIt<SignUpCubit>(),
      //             child: const SignupScreen(),
      //           ));

        //homeScreen
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
                
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text("No Route defined for${settings.name}")),
                ));
    }
  }
}
