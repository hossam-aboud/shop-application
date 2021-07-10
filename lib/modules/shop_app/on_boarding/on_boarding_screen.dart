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
  List<BoardingModel> itemsShow = [
    BoardingModel(
        'assets/images/one.jpeg', 'Boarding Title One', 'subtitle One'),
    BoardingModel(
        'assets/images/two.jpeg', 'Boarding Title Two', 'subtitle two'),
    BoardingModel(
        'assets/images/three.jpeg', 'Boarding Title Three', 'subtitle three'),
  ];

  final PageController _pageController = PageController();

  bool isBoardingReverse = true;
  bool isLast = false;
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              navigateReplacement(
                context: context,
                screen: ShopLoginScreen(),
              );
            },
            child: Text(
              'SKIP',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int currentIndex) {
                  if (currentIndex == itemsShow.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                    print('last');
                  } else {
                    print('first');
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (BuildContext context, int index) {
                  return buildBoardingItem(
                    model: itemsShow[index],
                  );
                },
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: itemsShow.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: itemsShow.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    spacing: 5.0,
                    dotWidth: 10.0,
                    dotHeight: 10.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      navigateReplacement(
                          context: context, screen: ShopLoginScreen());
                    } else {
                      _pageController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem({
    required BoardingModel model,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            '${model.image}',
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          '${model.title}',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '${model.body}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF000000),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        //   PageView.builder(
        //   itemBuilder: (BuildContext context, int index) {},
        // ),
      ],
    );
  }
}
