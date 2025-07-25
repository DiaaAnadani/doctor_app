import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/font_text_styles.dart';
import 'package:doctor_app/core/widgets/app_text_button.dart';
import 'package:doctor_app/features/home/logic/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/ui/widgets/dont_have_account.dart';
import 'package:doctor_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:doctor_app/features/login/ui/widgets/login_form.dart';
import 'package:doctor_app/features/login/ui/widgets/terms_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyles.font24BlueBold,
              ),
              verticalSpacing(8.h),
              Text(
                "We're excited to have you back,We can't wait to see what you've been up to since last logging in.",
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpacing(36.h),
              Column(
                children: [
                  const EmailAndPasswordForm(),
                  verticalSpacing(24.h),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyles.font13mainBlueRegular,
                    ),
                  ),
                  verticalSpacing(40.h),
                  AppTextButton(
                      textButton: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      }),
                  verticalSpacing(16.h),
                  const TermsAndConditionsText(),
                  verticalSpacing(60.h),
                  const DontHaveAccountText(),
                  const LoginBlocListener(),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
