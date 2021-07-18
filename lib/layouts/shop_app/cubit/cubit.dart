import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/shop_app/cubit/states.dart';
import 'package:news_app/model/shop_app/home_model.dart';
import 'package:news_app/modules/shop_app/categories/categories_screen.dart';
import 'package:news_app/modules/shop_app/favorites/favorites_screen.dart';
import 'package:news_app/modules/shop_app/products/products_screen.dart';
import 'package:news_app/modules/shop_app/settings/settings_screen.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/networks/end_points.dart';
import 'package:news_app/shared/networks/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  int currentIndex = 0;

  List screens = <Map<String, Object>>[
    {
      'title': 'Products',
      'screen': ProductsScreen(),
    },
    {
      'title': 'Categories',
      'screen': CategoriesScreen(),
    },
    {
      'title': 'Favorites',
      'screen': FavoritesScreen(),
    },
    {
      'title': 'Settings',
      'screen': SettingsScreen(),
    },
  ];

  List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.apps,
      ),
      label: 'Categories',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
      ),
      label: 'Favorites',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavigation());
  }

  HomeModel? homeModel;
  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getDate(url: HOME, tokenID: token).then((value) {
      homeModel = HomeModel.fromJSON(value.data);
      print(homeModel!.status);
      print(homeModel!.data.banners[0].image);
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      emit(ShopErrorHomeDataState(error.toString()));
    });
  }
}
