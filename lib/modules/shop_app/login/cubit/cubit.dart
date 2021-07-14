import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/shop_app/login/cubit/states.dart';
import 'package:news_app/shared/networks/end_points.dart';
import 'package:news_app/shared/networks/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  void getData({
    required String emailAddress,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': emailAddress,
      'password': password,
    }).then((value) {
      print(value.data);
      emit(ShopLoginSuccessState());
    }).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isSecure = true;

  void changePasswordVisibility() {
    isSecure = !isSecure;
    suffix =
        isSecure ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}
