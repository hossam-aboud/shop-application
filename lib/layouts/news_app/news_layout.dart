import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/cubit.dart';
import 'package:news_app/layouts/news_app/cubit/states.dart';
import 'package:news_app/modules/news_app/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';

class NewsApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, NewsStates state) {},
      builder: (BuildContext context, NewsStates state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItemsStyle,
            currentIndex: cubit.currentScreenIndex,
            onTap: (int value) {
              cubit.changeCurrentScreen(currentScreen: value);
            },
          ),
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  navigateTo(context: context, screen: SearchNewsScreen());
                },
              ),
              IconButton(
                icon: ThemeCubit.get(context).isDark
                    ? Icon(Icons.lightbulb_outline)
                    : Icon(Icons.dark_mode_outlined),
                onPressed: () {
                  ThemeCubit.get(context).changeModeApplication();
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.currentScreenIndex]['screen'] as Widget?,
        );
      },
    );
  }
}
