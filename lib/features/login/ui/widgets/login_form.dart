import 'package:doctor_app/core/helpers/app_regex.dart';
import 'package:doctor_app/core/helpers/spacing.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/widgets/app_text_form_field.dart';
import 'package:doctor_app/features/home/logic/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({super.key});

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  //final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    emailController = context.read<LoginCubit>().emailControllerCubit;
    passwordController = context.read<LoginCubit>().passwordControllerCubit;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  AppRegex.isEmailValid(value)) {
                return "Please enter a valid email";
              }
            },
            controller: context.read<LoginCubit>().emailControllerCubit,
          ),
          verticalSpacing(18.h),
          AppTextFormField(
            hintText: "Password",
            controller: context.read<LoginCubit>().passwordControllerCubit,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                  color: isObscureText
                      ? ColorsManager.lightGray
                      : ColorsManager.mainBlue),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid password";
              }
            },
          ),
          verticalSpacing(24.h),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
