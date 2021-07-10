import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/networks/local/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit () : super (ThemeInitialState());

  static ThemeCubit get (BuildContext context) => BlocProvider.of(context);



  bool isDark = false;

  void changeModeApplication ( {
     bool? isDarkFromSharedPref}) {
    if (isDarkFromSharedPref != null){
       isDark = isDarkFromSharedPref;
       emit(ThemeChangeModeApplicationState());
    }else {
      isDark = !isDark;

      emit(ThemeChangeModeApplicationState());

    }
    CacheHelper.setBoolean(key: 'isDark', value: isDark);
  }
}