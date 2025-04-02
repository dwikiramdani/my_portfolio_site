import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

  List<Widget> buildIntro() {
    return [
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
        'I make Android and iOS Application\nFlutter & React Native ',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
      ),
      const SizedBox(height: 32),
      Text(
        'I am a seasoned Software Developer with over\n5 years of professional experience specializing in\nMulti-Platform Software Development',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
      ),
    ];
  }

  Widget buildTechStacks() {
    List<Widget> widgets = [];
    techIcons.forEach((element) {
      widgets.add(
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Color(0xFF8491A0),),
            borderRadius: BorderRadius.circular(12)
          ),
          child: SvgPicture.asset(element, color: Color(0xFF8491A0),),
        )
      );
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
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
            ...buildIntro(),
            const SizedBox(height: 32),
            InkWell(
              child: Container(
                width: 200,
                height: 64,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(32)
                ),
                child: Text(
                  "Download CV",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            buildTechStacks(),
          ],
        ),
      ),
    );
  }
}

List<String> techIcons = [
  "assets/tech/android.svg",
  "assets/tech/ios.svg",
  "assets/tech/flutter.svg",
  "assets/tech/react.svg",
  "assets/tech/javascript.svg",
  "assets/tech/dart.svg",
];

List<Map<String, dynamic>> experiences = [
  {
    "logo": "",
    "company": "",
    "period": "",
    "description": "",
  }
];
