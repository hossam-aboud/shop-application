import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/shop_app/shop_layout.dart';
import 'package:news_app/modules/shop_app/login/cubit/cubit.dart';
import 'package:news_app/modules/shop_app/login/cubit/states.dart';
import 'package:news_app/modules/shop_app/register/shop_register_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/networks/local/cache_helper.dart';

class ShopLoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ShopLoginCubit();
      },
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (BuildContext context, ShopLoginStates state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status == true) {
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                navigateReplacement(context: context, screen: ShopLayout());
              }).catchError((error) {});
            } else {
              toast(
                messageToast: state.loginModel.message,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (BuildContext context, ShopLoginStates state) {
          ShopLoginCubit cubitLogin = ShopLoginCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formState,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            'Login Now to browse our hot offers',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.grey,
                                    ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          defaultFormField(
                            context: context,
                            onChanged: (value) {},
                            onTapFunction: () {},
                            onSubmit: (String value) {},
                            controller: _emailController,
                            type: TextInputType.emailAddress,
                            label: 'Email Address',
                            prefix: Icons.email_outlined,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'The Field Must Not been Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                            context: context,
                            onChanged: (value) {},
                            onTapFunction: () {},
                            onSubmit: (String value) {
                              if (_formState.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                cubitLogin.getData(
                                  context: context,
                                  emailAddress: _emailController.text,
                                  password: _passwordController.text,
                                );
                              }
                            },
                            controller: _passwordController,
                            type: TextInputType.visiblePassword,
                            isSecureText: cubitLogin.isSecure,
                            label: 'Password',
                            suffix: cubitLogin.suffix,
                            suffixPressed: () {
                              cubitLogin.changePasswordVisibility();
                            },
                            prefix: Icons.lock_outline,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password Is too short';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          state is! ShopLoginLoadingState
                              ? Builder(
                                  builder: (BuildContext context) {
                                    return defaultBuildButton(
                                      labelText: 'LOGIN',
                                      onPressed: () {
                                        if (_formState.currentState!
                                            .validate()) {
                                          FocusScope.of(context).unfocus();
                                          cubitLogin.getData(
                                            context: context,
                                            emailAddress: _emailController.text,
                                            password: _passwordController.text,
                                          );
                                        }
                                      },
                                      isUpperCase: true,
                                    );
                                  },
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              defaultTextButton(
                                onPressed: () {
                                  navigateTo(
                                      context: context,
                                      screen: ShopRegisterScreen());
                                },
                                labelText: 'register',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
