import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget buildNavbarMenu({required String title}) {
    return Text(
      title,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    );
  }

  Widget buildNavigationMenu() {
    return Material(
      elevation: 1,
      child: Container(
        width: double.infinity,
        height: 80,
        color: Color(0xFF222222),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/my_logo_kiram.png"),
            Row(
              children: [
                buildNavbarMenu(title: "Home"),
                SizedBox(width: 32),
                buildNavbarMenu(title: "Projects"),
                SizedBox(width: 32),
                buildNavbarMenu(title: "Experiences"),
                SizedBox(width: 32),
                buildNavbarMenu(title: "Contact"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161513),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildNavigationMenu(),
            const SizedBox(height: 80),
            Container(
              width: 160,
              height: 160,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage("assets/my_logo_kiram.png"),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'I do Flutter and React Native \nMake Android and iOS Applications',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),

            ),
          ],
        ),
      ),
    );
  }
}
