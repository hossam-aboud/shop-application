// https://newsapi.org/v2/everything?q=tesla&apiKey=76d8cb4108754b9a892cd1ade58bb184

// https://www.getpostman.com/collections/94db931dc503afd508a5

import 'package:flutter/cupertino.dart';
import 'package:news_app/modules/shop_app/login/shop_login_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/networks/local/cache_helper.dart';

void signOut(BuildContext context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateReplacement(
        context: context,
        screen: ShopLoginScreen(),
      );
    }
  }).catchError((error) {
    print(error.toString());
  });
}

late String? token;
