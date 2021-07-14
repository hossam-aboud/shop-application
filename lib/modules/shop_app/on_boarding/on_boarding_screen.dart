import 'package:flutter/material.dart';
import 'package:news_app/model/boarding_model.dart';
import 'package:news_app/modules/shop_app/login/shop_login_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/styles/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  List<BoardingModel> itemData = <BoardingModel>[
    BoardingModel('assets/images/one.jpeg', 'On Boarding Title One',
        'On subBoarding Title One'),
    BoardingModel('assets/images/one.jpeg', 'On Boarding Title two',
        'On subBoarding Title two'),
    BoardingModel('assets/images/one.jpeg', 'On Boarding Title three',
        'On subBoarding Title three'),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
            onPressed: () {
              navigateReplacement(
                context: context,
                screen: ShopLoginScreen(),
              );
            },
            labelText: 'SKIP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: defaultColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 40.0,),
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == itemData.length - 1) {
                    setState(() {
                      isLast = true;
                      print('lasting');
                    });
                  } else {
                    setState(() {
                      isLast = false;
                      print('not last');
                    });
                  }
                },
                itemBuilder: (BuildContext context, int index) {
                  return _buildItemDesign(
                    context: context,
                    dataModel: itemData[index],
                  );
                },
                controller: _pageController,
                itemCount: itemData.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
            Row(
              children: [
                _buildIndicator(),
                Spacer(),
                FloatingActionButton.extended(
                  onPressed: () {
                    if (isLast) {
                      navigateReplacement(
                          context: context, screen: ShopLoginScreen());
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 720),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  label: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: itemData.length,
      effect: ExpandingDotsEffect(
        dotHeight: 10.0,
        dotWidth: 10.0,
        dotColor: Colors.grey,
        activeDotColor: defaultColor,
      ),
    );
  }

  Widget _buildItemDesign({
    required BuildContext context,
    required BoardingModel dataModel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(
            '${dataModel.image}',
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          '${dataModel.title}',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          '${dataModel.body}',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
