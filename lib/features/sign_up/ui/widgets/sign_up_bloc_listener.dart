// import 'package:doctor_app/core/helpers/extensions.dart';
// import 'package:doctor_app/core/routing/routes.dart';
// import 'package:doctor_app/core/theming/colors.dart';
// import 'package:doctor_app/core/theming/font_text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SignupBlocListener extends StatelessWidget {
//   const SignupBlocListener({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SignUpCubit, SignUpState>(
//       listenWhen: (previous, current) =>
//           current is signupLoading || current is signupSuccess || current is signupError,
//       listener: (context, state) {
//         state.whenOrNull(
//           signupLoading: () {
//             showDialog(
//               context: context,
//               builder: (context) => const Center(
//                   child: CircularProgressIndicator(
//                 color: ColorsManager.mainBlue,
//               )),
//             );
//           },
//           signupSuccess: (signUpResponse) {
//             context.pop();
//             context.pushNamed(Routes.homeScreen);
//           },
//           signupError: (error) {
//             setUpErrorState(context, error);
//           },
//         );
//       },
//       child: const SizedBox.shrink(),
//     );
//   }

//   void setUpErrorState(BuildContext context, String error) {
//        context.pop();
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               icon: const Icon(
//                 Icons.error,
//                 color: Colors.red,
//                 size: 32,
//               ),
//               content: Text(
//                 error,
//                 style: TextStyles.font15darkBlueMedium,
//               ),
//               actions: [
//                 TextButton(
//                     onPressed: () {
//                       context.pop();
//                     },
//                     child: Text("Got it", style: TextStyles.font14BlueSemiBold,))
//               ],
//             ));
//   }
// }
