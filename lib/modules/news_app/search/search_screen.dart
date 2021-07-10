import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/cubit.dart';
import 'package:news_app/layouts/news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, NewsStates state) {},
      builder: (context, NewsStates state) {
        List searchDataList = NewsCubit.get(context).searchData;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    context: context,
                    controller: searchController,
                    type: TextInputType.text,
                    label: 'Search',
                    prefix: Icons.search,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'The Field Must be Not Empty';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      NewsCubit.get(context).getSearchData(value: value);
                      print(value.toString());
                    }),
              ),
              Expanded(
                  child:
                      articleBuilder(list: searchDataList, context: context)),
            ],
          ),
        );
      },
    );
  }
}
