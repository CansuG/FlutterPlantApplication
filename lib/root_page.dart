import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/screens/camera_screen.dart';
import 'package:plant_app/screens/cart_screen.dart';
import 'package:plant_app/screens/favorite_screen.dart';
import 'package:plant_app/screens/home_screen.dart';
import 'package:plant_app/screens/my_profile_screen.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'models/tab_model.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_bag,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {

    return Consumer<TabModel>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Selector<TabModel, int>(
                  builder: (context, index, child) {
                    return Text(
                      titleList[index],
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    );
                  },
                  selector: (context, model) => model.selectedTab,
                ),
                Icon(Icons.notifications_active,
                    color: Constants.blackColor, size: 32)
              ],
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0),
        body: IndexedStack(index: tabManager.selectedTab, children: <Widget>[
          HomePage(),
          FavoritesPage(),
          CartPage(),
          MyProfilePage()
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const CameraPage(),
                    type: PageTransitionType.bottomToTop));
          },
          child: Image.asset("assets/images/camera.png", height: 22),
          backgroundColor: Constants.primaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
            splashColor: Constants.primaryColor,
            activeColor: Constants.primaryColor,
            inactiveColor: Colors.black.withOpacity(.5),
            icons: iconList,
            activeIndex: tabManager.selectedTab,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) {
              tabManager.goToTab(index);
            }),
      );
    });
  }


}
