import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var selectedTab = 3;

  Widget buildNavbarMenu({required int id, required String title}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = id;
        });
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildNavigationMenu() {
    List<Widget> widgets = [];
    for (var element in navItems) {
      widgets.add(buildNavbarMenu(id: element["id"], title: element["title"]));
      if (element["id"] != 4) {
        widgets.add(SizedBox(width: 32));
      }
    }
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
            Row(children: widgets),
          ],
        ),
      ),
    );
  }

  Widget buildHome() {
    return Column(
      children: [
        ...buildIntro(),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(fileUrl))) {
              await launchUrl(Uri.parse(fileUrl));
            } else {
              print("Could not launch $fileUrl");
            }
          },
          child: Container(
            width: 200,
            height: 64,
            alignment: Alignment.center,
            child: Text(
              "Download CV",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(height: 32),
        buildTechStacks(),
        const SizedBox(height: 32),
      ],
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
          image: DecorationImage(image: AssetImage("assets/my_logo_kiram.png")),
        ),
      ),
      const SizedBox(height: 32),
      Container(
        width: 800,
        child: Text(
          'I make Android and iOS Application Flutter & React Native ',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
        ),
      ),
      const SizedBox(height: 32),
      SizedBox(
        width: 520,
        child: Text(
          'I am a seasoned Software Developer with over 5 years of professional experience specializing in Multi-Platform Software Development',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
      ),
    ];
  }

  Widget buildTechStacks() {
    List<Widget> widgets = [];
    for (var element in techIcons) {
      widgets.add(
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Color(0xFF8491A0)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(element, color: Color(0xFF8491A0)),
        ),
      );
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: widgets);
  }

  Widget buildExperiences() {
    final screenSizeWidth = MediaQuery.of(context).size.width;
    List<Widget> widgets = [];
    for (var element in experiences) {
      widgets.add(
        Container(
          width: screenSizeWidth * 0.6,
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage(element["logo"]),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          element["company"],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    element["period"],
                    style: TextStyle(fontSize: 16, color: Color(0xFF8491A0)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                element["position"],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                element["description"],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Experiences",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 32),
        ...widgets,
      ],
    );
  }

  Widget buildProjects() {
    final screenSizeWidth = MediaQuery.of(context).size.width;
    List<Widget> widgets = [];
    for (var element in experiences) {
      widgets.add(
        Container(
          width: screenSizeWidth * 0.6,
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage(element["logo"]),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          element["company"],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    element["period"],
                    style: TextStyle(fontSize: 16, color: Color(0xFF8491A0)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                element["position"],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                element["description"],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Projects",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 32),
          GridView.count(
            shrinkWrap: true, // Allow GridView to be scrollable
            physics: AlwaysScrollableScrollPhysics(), // Enable scrolling
            crossAxisCount: 3,
            mainAxisSpacing: 80,
            crossAxisSpacing: 64,
            children: List.generate(10, (index) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFF8491A0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Item $index',
                        style: TextTheme.of(context).headlineSmall,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildMainContent() {
    Widget selectedWidget = SizedBox();
    switch (selectedTab) {
      case 1:
        selectedWidget = buildHome();
        break;
      case 2:
        selectedWidget = buildExperiences();
        break;
      case 3:
        selectedWidget = buildProjects();
        break;
    }
    return selectedWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161513),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              buildNavigationMenu(),
              const SizedBox(height: 64),
              buildMainContent(),
            ],
          ),
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
    "logo": "assets/company/gramedia_logo.jpeg",
    "company": "Kompas Gramedia",
    "position": "Mobile Engineer - Flutter",
    "period": "April 2022 - April 2025",
    "description":
        "My role in this position, is to recreate current application from Native (Java and Swift) "
        "and rewrite it to hybrid application for multiplatform device Android and iOS. Built using Flutter "
        "as main tech stack. Firebase for Analytic, Crashlytics, Realtime Database, Remote Config, and Firebase Cloud Messaging. "
        "I also responsible to ensure improve quality of Epub and PDF reader by implement in house native Library to Flutter",
  },
  {
    "logo": "assets/company/goers_logo.jpeg",
    "company": "Goers",
    "position": "Mobile Engineer - Flutter",
    "period": "August 2019 - April 2022",
    "description":
        "I played crucial role to do refactor and rewrite of legacy code from React Native into Flutter. "
        "My main responsibility is to ensure a clean and optimized refactored code to be working flawlessly "
        "and prevent any potential issue that will occur when refactor and rewrite code is done. Other than rewrite and refactor, "
        "my responsibilities also working on implementing Ministry of Health mandatory health checkup verification when Covid Outbreak happens "
        "in 2020 to ensure user safety and to maintain business to keep running and increase company revenue even there are market crash for "
        "event and travel is restricted",
  },
  {
    "logo": "assets/company/zipkos_logo.jpeg",
    "company": "Zipkos",
    "position": "Mobile Engineer - React Native",
    "period": "November 2020 - June 2021",
    "description":
        "I was giving responsibility to create House Rent Booking Feature, my role is to ensure user to easily "
        "finding house for rent that best suited for them, also make it easy to communicate with owner regarding "
        "housing detail and renting. As for the owner, I ensure they can manage their property with ease, also "
        "providing IoT component to observe their property in realtime",
  },
  {
    "logo": "assets/company/icubic_logo.jpeg",
    "company": "Icubic",
    "position": "Mobile Engineer - React Native",
    "period": "March 2019 - August 2019",
    "description":
        "My responsibility in my time working in Icubic, I was working on creating Running Event App. Developed with React Native "
        "as Technology Stack, with main feature is event marketplace, user running tracker, and event running tracker. Google Cloud Platform "
        "is used to create realtime geolocation tracker",
  },
];

List<Map<String, dynamic>> navItems = [
  {"id": 1, "title": "Home"},
  {"id": 2, "title": "Experiences"},
  {"id": 3, "title": "Projects"},
  {"id": 4, "title": "Contact"},
];

final fileUrl =
    "https://drive.google.com/uc?export=download&id=19lbMvcu9NPHjah4bVJsYZApnCvi-NpoZ";
