import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/screens/my_plants_list_screen.dart';
import 'package:plant_app/screens/sign_in_screen.dart';
import '../components/profile_widget.dart';
import '../constants.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 170,
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: ExactAssetImage('assets/images/profile.jpeg'),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(0.6),
                  width: 5.0,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width * 0.3,
              child: Row(
                children: [
                  Text(
                    'Ece Çınar',
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'ececinar@gmail.com',
              style: TextStyle(
                color: Constants.blackColor.withOpacity(0.3),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: size.height * 0.7,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileWidget(
                    icon: Icons.person,
                    title: 'My Profile',
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              child: MyPlantsListScreen(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: ProfileWidget(
                        icon: Icons.compost_outlined, title: "My Plants"),
                  ),
                  ProfileWidget(
                    icon: Icons.notifications,
                    title: 'Notifications',
                  ),
                  ProfileWidget(
                    icon: Icons.share,
                    title: 'Share',
                  ),
                  ProfileWidget(
                    icon: Icons.settings,
                    title: 'Settings',
                  ),
                  GestureDetector(
                      child: ProfileWidget(icon: Icons.logout, title: 'Logout'),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: SignIn(),
                            type: PageTransitionType.bottomToTop));
                  },)
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
