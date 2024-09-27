import 'package:flutter/material.dart';
import 'package:untitled2/constants/constants.dart';
import 'package:untitled2/utils/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Portfolio extends StatelessWidget {
  Portfolio({super.key});
  List<Project> projectList = [
    Project(
        title: "OneVasco",
        description:
            "Your gateway to effortless travel! Available on both Play Store and App Store, OneVasco revolutionizes the e-Visa application process with its user-friendly design and streamlined functionality. With just a few taps, users can apply for visas, track their application status, and receive real-time updates, all from the palm of their hand. Enhanced with secure payment integration and multilingual support, OneVasco empowers travelers worldwide to navigate the visa process with confidence and ease.",
        link: "https://github.com/dharmendra7899/merchant_aap.git",
        technologies: ['Flutter', 'Dart', "CCAvenue"]),
    Project(
        title: "PIPOnet",
        description:
            "Stay on track with real-time train status updates at your fingertips! Available for download, PIPOnet simplifies your travel experience by providing accurate information on train locations, schedules, and delays. With an intuitive interface and instant notifications, users can effortlessly check 'Where is my train?' and plan their journeys with confidence. Whether you're a daily commuter or an occasional traveler, PIPOnet ensures you never miss a beat on your rail adventures!",
        link: "https://github.com/dharmendra7899/merchant_aap.git",
        technologies: ['Flutter', 'Dart', "Firebase"]),
    Project(
        title: "Rb Restaurant",
        description:
            "Savor the flavors of your favorite dishes right from your device! Designed for food lovers, the RB Restaurant app makes online food ordering a breeze. Browse through an extensive menu filled with delicious options, customize your orders, and enjoy seamless payment options. With real-time order tracking and prompt delivery, satisfying your cravings has never been easier. Whether you're at home or on the go, RB Restaurant brings culinary delights to your doorstep, ensuring a delightful dining experience every time!",
        link: "https://github.com/dharmendra7899/merchant_aap.git",
        technologies: ['Flutter', 'Dart', "SQLite"]),
    Project(
        title: "Shop Sasta",
        description:
            "Your ultimate grocery shopping companion in Pune! Tailored for convenience and affordability, Shop Sasta offers a wide range of everyday essentials at unbeatable prices. With an easy-to-navigate interface, users can effortlessly browse through fresh produce, pantry staples, and household items, all from the comfort of their homes. Enjoy fast delivery right to your doorstep, exclusive deals, and personalized recommendations that make shopping a breeze. Experience the future of grocery shopping with Shop Sasta, where quality meets affordability in Pune!",
        link: "https://github.com/dharmendra7899/merchant_aap.git",
        technologies: ['Flutter', 'Dart']),
    Project(
        title: "CloseToBuy",
        description: "A template for Portfolio",
        link: "https://github.com/dharmendra7899/merchant_aap.git",
        technologies: ['Flutter', 'Dart', "RazorPay", "Firebase"]),
    Project(
        title: "Mechmiles Customer",
        description:
            "Your go-to destination for all vehicle spare parts and services, now available on both the App Store and Play Store! Designed for car enthusiasts and everyday drivers alike, MechMiles offers a comprehensive range of high-quality spare parts, tools, and maintenance services right at your fingertips. With an intuitive interface, users can easily browse and order parts, book services, and track their orders in real-time. Enjoy the convenience of reliable service and expert support, ensuring your vehicle is always in top condition. Drive with confidence and keep your vehicle running smoothly with MechMiles!",
        link: "https://github.com/dharmendra7899/merchant_aap.git",
        technologies: ['Flutter', 'Dart']),
    Project(
        title: "Mechmiles POS",
        description:
            "Your go-to destination for all vehicle spare parts and services, now available on both the App Store and Play Store! Designed for car enthusiasts and everyday drivers alike, MechMiles offers a comprehensive range of high-quality spare parts, tools, and maintenance services right at your fingertips. With an intuitive interface, users can easily browse and order parts, book services, and track their orders in real-time. Enjoy the convenience of reliable service and expert support, ensuring your vehicle is always in top condition. Drive with confidence and keep your vehicle running smoothly with MechMiles!",
        link: "https://github.com/dharmendra7899/merchant_aap.git",
        technologies: ['Flutter', 'Dart'])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kWhite,
        title: appText(
          title: "Portfolio",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: kTextColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1000) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 2.2,
                ),
                itemCount: projectList.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project1: projectList[index]);
                },
              );
            } else {
              return ListView.builder(
                itemCount: projectList.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project1: projectList[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project1;

  const ProjectCard({super.key, required this.project1});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText(
              title: project1.title,
              color: kTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 10),
            appText(
              title: project1.description,
              color: kTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8.0,
                  children: project1.technologies
                      .map((tech) => Chip(label: Text(tech)))
                      .toList(),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(project1.link);
                    await launchUrl(url);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: appText(
                    title: 'View Project',
                    color: kWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String link;
  final List<String> technologies;

  Project({
    required this.title,
    required this.description,
    required this.link,
    required this.technologies,
  });
}
