import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/states.dart';
import 'package:news_app/modules/news_app/business/business_screen.dart';
import 'package:news_app/modules/news_app/science/science_screen.dart';
import 'package:news_app/modules/news_app/sports/sports_screen.dart';
import 'package:news_app/shared/networks/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);
  List<Map<String, Object>> screens = [
    {'screen': BusinessScreen(), 'title': 'Business Screen'},
    {'screen': ScienceScreen(), 'title': 'Science Screen'},
    {'screen': SportsScreen(), 'title': 'Sports Screen'},
  ];
  int currentScreenIndex = 0;
  List<BottomNavigationBarItem> bottomItemsStyle = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
  ];

  void changeCurrentScreen({required int currentScreen}) {
    currentScreenIndex = currentScreen;
    if (currentScreen == 1)
      getSciencesData();
    else if (currentScreen == 2) getSportsData();
    emit(NewsChangeBottomNavState());
  }

  late List<dynamic> businessData = [];
  void getBusinessData() {
    emit(NewsGetLoadingBusinessDataState());
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '76d8cb4108754b9a892cd1ade58bb184',
    }).then((value) {
      businessData = value.data['articles'];
      emit(NewsGetSuccessfullyBusinessDataState());
      print(businessData[0]['title']);
    }).catchError((error) {
      emit(NewsGetErrorBusinessDataState(error.toString()));
      print(error.toString());
      print('error , when get data business');
    });
  }

  late List<dynamic> scienceData = [];
  void getSciencesData() {
    emit(NewsGetLoadingScienceDataState());
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '76d8cb4108754b9a892cd1ade58bb184',
    }).then((value) {
      scienceData = value.data['articles'];
      emit(NewsGetSuccessfullyScienceDataState());
      print(scienceData[0]['title']);
    }).catchError((error) {
      emit(NewsGetErrorScienceDataState(error.toString()));
      print(error.toString());
      print('error , when get data business');
    });
  }

  late List<dynamic> sportsData = [];
  void getSportsData() {
    emit(NewsGetLoadingSportsDataState());
    DioHelper.getDate(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '76d8cb4108754b9a892cd1ade58bb184',
    }).then((value) {
      sportsData = value.data['articles'];
      emit(NewsGetSuccessfullySportsDataState());
      print(sportsData[0]['title']);
    }).catchError((error) {
      emit(NewsGetErrorSportsDataState(error.toString()));
      print(error.toString());
      print('error , when get data business');
    });
  }

  late List<dynamic> searchData = [];
  void getSearchData({required String value}) {
    emit(NewsGetLoadingSearchDataState());
    DioHelper.getDate(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '76d8cb4108754b9a892cd1ade58bb184',
    }).then((value) {
      searchData = value.data['articles'];
      emit(NewsGetSuccessfullySearchDataState());
      print(searchData[0]['title']);
    }).catchError((error) {
      emit(NewsGetErrorSearchDataState(error.toString()));
      print(error.toString());
      print('error , when get data business');
    });
  }
}
