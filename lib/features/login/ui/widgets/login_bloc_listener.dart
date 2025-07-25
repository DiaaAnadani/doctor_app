import 'package:doctor_app/core/helpers/extensions.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/core/theming/colors.dart';
import 'package:doctor_app/core/theming/font_text_styles.dart';
import 'package:doctor_app/features/home/logic/cubit/login_cubit.dart';
import 'package:doctor_app/features/home/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Error || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                  child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              )),
            );
          },
          loginSuccess: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          loginError: (error) {
            setUpErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setUpErrorState(BuildContext context, String error) {
       context.pop();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Colors.red,
                size: 32,
              ),
              content: Text(
                error,
                style: TextStyles.font15darkBlueMedium,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text("Got it", style: TextStyles.font14BlueSemiBold,))
              ],
            ));
  }
}
