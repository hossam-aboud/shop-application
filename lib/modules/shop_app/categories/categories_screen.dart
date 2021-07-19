import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/shop_app/cubit/cubit.dart';
import 'package:news_app/layouts/shop_app/cubit/states.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener:  (BuildContext context , ShopStates state){},
      builder:  (BuildContext context , ShopStates state) {
        ShopCubit cubit = ShopCubit.get(context);
        return Center(
        child: Text(
          'Categories Screen',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
      },
    );
  }
}
