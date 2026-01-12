import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/utils/functions/app_router.dart';
import 'package:ecommerce_app/core/utils/functions/size_config.dart';
import 'package:ecommerce_app/core/utils/functions/styles.dart';
import 'package:ecommerce_app/features/authentication/presentation/manager/auth_cubit/login_cubit_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/manager/auth_cubit/login_cubit_state.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  String? password;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              GoRouter.of(context).pushReplacement(AppRouter.kMainView);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      Text(
                        'Sign in',
                        style: Styles.kTextStyle32.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(height: 30),

                      Container(
                        constraints: BoxConstraints(
                          maxHeight: SizeConfig.scale(95, context),
                        ),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: kPrimaryColor,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          children: [
                            CustomTextFromField(
                              text: '',
                              hintText: 'Email',
                              onChanged: (data) => email = data,
                            ),
                            const SizedBox(height: 10),
                            CustomTextFromField(
                              text: '',
                              hintText: 'Password',
                              obscureText: true,
                              onChanged: (data) => password = data,
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "forget password ?",
                                  style: Styles.kTextStyle18.copyWith(
                                    color: kTextColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            state is AuthLoading
                                ? const CircularProgressIndicator()
                                : CustomButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<AuthCubit>().login(
                                          email!,
                                          password!,
                                        );
                                      }
                                    },
                                    text: "Sign in",
                                  ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () => GoRouter.of(
                                context,
                              ).push(AppRouter.kRegisterView),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'sign up',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Don\'t have account ?',
                                    style: Styles.kTextStyle18.copyWith(
                                      color: kTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
