import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var selectedTab = 4;

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
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
        if (screenWidth < 600) {
          return 1;
        } else if (screenWidth < 1200) {
          return 2;
        } else {
          return 3;
        }
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
            crossAxisCount: getCrossAxisCount(),
            mainAxisSpacing: 32,
            crossAxisSpacing: 32,
            children: List.generate(projects.length, (index) {
              var item = projects[index];
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFF8491A0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage(item["image"]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              item['title'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              item['description'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => showProjectModal(context, item),
                        child: const Text("Link"),
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          side: BorderSide(color: Colors.white10, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
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

  void showProjectModal(BuildContext context, Map item) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF161513),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: const EdgeInsets.all(24),
        content: SizedBox(
          width: 600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage(item["image"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Title
              Text(
                item["title"],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                item["description"],
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 32),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (item["playstore"] != null)
                    ElevatedButton.icon(
                      onPressed: () => _launchUrl(item["playstore"]),
                          icon: const Icon(Icons.android, color: Colors.grey),
                      label: const Text("Download"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        side: const BorderSide(color: Colors.white10, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  if (item["appstore"] != null)
                    ElevatedButton.icon(
                      onPressed: () => _launchUrl(item["appstore"]),
                          icon: const Icon(Icons.apple, color: Colors.grey),
                      label: const Text("App Store"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        side: const BorderSide(color: Colors.white10, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      print("URL: $url");
      await launchUrl(
        uri,
        mode: kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication,
      );
    }
  }

  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  void sendEmail() async {
    final subject = Uri.encodeComponent(_subjectController.text.trim());
    final body = Uri.encodeComponent(_messageController.text.trim());

    final gmailUrl =
        'https://mail.google.com/mail/?view=cm&to=official.dwikiramdani@gmail.com&su=$subject&body=$body';

    final uri = Uri.parse(gmailUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Open in new tab on web
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open Gmail")),
      );
    }
  }

  Widget buildContactMe() {
    final screenSizeWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Contact Me",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 120, vertical: 32), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Subject"),
              TextField(
                controller: _subjectController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),

              const Text("Message"),
              TextField(
                controller: _messageController,
                maxLines: 5,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: sendEmail,
                child: const Text("Send Message"),
              ),
            ],
          ),
        )
      ],
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
      case 4:
        selectedWidget = buildContactMe();
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
