import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/cubit.dart';
import 'package:news_app/layouts/shop_app/cubit/cubit.dart';
import 'package:news_app/layouts/shop_app/shop_layout.dart';
import 'package:news_app/modules/shop_app/login/shop_login_screen.dart';
import 'package:news_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/networks/local/cache_helper.dart';
import 'package:news_app/shared/networks/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';
import 'package:news_app/shared/tracking_blocs/tracking_blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDarkApp = CacheHelper.getBoolean(key: 'isDark');
  bool onBoarding = CacheHelper.getSaveData(key: 'onBoarding') ?? false;
  token = CacheHelper.getSaveData(key: 'token') ?? null;
  late Widget widget;

  if (onBoarding != false) if (token != null)
    widget = ShopLayout();
  else
    widget = ShopLoginScreen();
  else
    widget = OnBoardingScreen();

  runApp(MyApp(
    isDarkApplication: isDarkApp,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDarkApplication;
  final Widget startWidget;

  MyApp({required this.isDarkApplication, required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return NewsCubit()..getBusinessData();
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return ThemeCubit()
              ..changeModeApplication(isDarkFromSharedPref: isDarkApplication);
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            // cascade
            return ShopCubit()
              ..getHomeData()
              ..getCategoriesData();
          },
        ),
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (BuildContext context, ThemeStates state) {},
        builder: (BuildContext context, ThemeStates state) {
          ThemeCubit themeCubit = ThemeCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter News App',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeCubit.isDark ? ThemeMode.light : ThemeMode.dark,
            home: startWidget,
          );
        },
      ),
    );
  }
}
