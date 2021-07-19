import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/shop_app/cubit/cubit.dart';
import 'package:news_app/layouts/shop_app/cubit/states.dart';
import 'package:news_app/model/shop_app/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, ShopStates state) {},
      builder: (BuildContext context, ShopStates state) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ShopCubit.get(context).categoriesModel != null
                ? buildCatItem(
                    model: ShopCubit.get(context)
                        .categoriesModel!
                        .data
                        .dataModel[index],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount:
              ShopCubit.get(context).categoriesModel!.data.dataModel.length,
        );
      },
    );
  }

  Widget buildCatItem({
    required DataModel model,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage('${model.image}'),
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            '${model.name}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
