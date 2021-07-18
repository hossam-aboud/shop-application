import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/shop_app/cubit/cubit.dart';
import 'package:news_app/layouts/shop_app/cubit/states.dart';
import 'package:news_app/modules/shop_app/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, ShopStates state) {
        if (state is ShopErrorHomeDataState) {
          print(state.error.toString());
        }
      },
      builder: (BuildContext context, ShopStates state) {
        ShopCubit shopCubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Salla'),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(
                    context: context,
                    screen: SearchShopScreen(),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: shopCubit.screens[shopCubit.currentIndex]['screen'],
          bottomNavigationBar: BottomNavigationBar(
            items: shopCubit.bottomNavItems,
            currentIndex: shopCubit.currentIndex,
            onTap: (int index) {
              shopCubit.changeBottom(index);
            },
          ),
        );
      },
    );
  }
}
