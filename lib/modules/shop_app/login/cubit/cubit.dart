import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/shop_app/login_model.dart';
import 'package:news_app/modules/shop_app/login/cubit/states.dart';
import 'package:news_app/shared/networks/end_points.dart';
import 'package:news_app/shared/networks/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  late ShopLoginModel loginModel;
  void getData({
    required BuildContext context,
    required String emailAddress,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': emailAddress,
      'password': password,
    }).then((value) {
      loginModel = ShopLoginModel.fromJSON(value.data);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isSecure = true;

  void changePasswordVisibility() {
    isSecure = !isSecure;
    suffix =
        isSecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }
}
