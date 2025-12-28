import 'package:doctor_app/core/di/dependency_injection.dart';
import 'package:doctor_app/core/helpers/constants_shared_keys.dart';
import 'package:doctor_app/core/helpers/extensions.dart';
import 'package:doctor_app/core/helpers/shared_preference.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/features/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(appRouter: AppRouter()));
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getString(
    ConstantsSharedKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
