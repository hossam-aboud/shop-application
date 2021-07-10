import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/cubit.dart';
import 'package:news_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/networks/local/cache_helper.dart';
import 'package:news_app/shared/networks/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDarkApp = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(
    isDarkApplication: isDarkApp,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDarkApplication;

  MyApp({required this.isDarkApplication});
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
        )
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
            home: Directionality(
                textDirection: TextDirection.ltr, child: OnBoardingScreen()),
          );
        },
      ),
    );
  }
}
