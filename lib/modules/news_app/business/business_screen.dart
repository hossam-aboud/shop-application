import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/cubit.dart';
import 'package:news_app/layouts/news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, NewsStates states) {},
      builder: (BuildContext context, NewsStates state) {
        List dataOfBusiness = NewsCubit.get(context).businessData;
        return dataOfBusiness.length > 0
            ? articleBuilder(list: dataOfBusiness, context: context)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
