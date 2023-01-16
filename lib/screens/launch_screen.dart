import 'package:flutter/material.dart';
import 'package:plant_app/screens/sign_in_screen.dart';

import '../constants.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const SignIn()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                image: "assets/images/first-image.png",
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              createPage(
                image: "assets/images/second-image.png",
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
              createPage(
                image: "assets/images/third-image.png",
                title: Constants.titleThree,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 25,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 25,
            child: Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;

                      if (currentIndex < 3) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const SignIn()));
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

//indicator decorations widget
  Widget _indicator(bool isOn) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: isOn ? 28 : 12,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

//the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}

class createPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const createPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 110),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Constants.descpColor),
          )
        ],
      ),
    );
  }
}
