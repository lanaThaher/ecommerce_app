import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/core/utils/functions/app_router.dart';
import 'package:ecommerce_app/core/utils/functions/size_config.dart';
import 'package:ecommerce_app/core/utils/functions/styles.dart';
import 'package:ecommerce_app/features/authentication/presentation/manager/auth_cubit/login_cubit_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email;
  String? password;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  Text(
                    'Sign up ',
                    style: Styles.kTextStyle32.copyWith(color: kPrimaryColor),
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
                    child: SingleChildScrollView(
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

                          // Register button
                          CustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthCubit>().register(
                                  email: email!,
                                  password: password!,
                                );
                              }
                            },
                            text: "Sign up",
                          ),
                          const SizedBox(height: 10),

                          // Link to Login
                          GestureDetector(
                            onTap: () =>
                                GoRouter.of(context).push(AppRouter.kMainView),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account ?',
                                    style: Styles.kTextStyle18.copyWith(
                                      color: kTextColor,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Sign in',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
