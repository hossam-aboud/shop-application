import 'package:flutter/material.dart';

class SearchShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Search Screen',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
