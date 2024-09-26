import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled2/constants/constants.dart';
import 'package:untitled2/data/data.dart';
import 'package:untitled2/screens/portfolio.dart';
import 'package:untitled2/utils/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: ProfileSection()),
                    Flexible(child: AboutSection()),
                  ],
                );
              } else {
                // Mobile Layout
                return const SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileSection(),
                      SizedBox(height: 20),
                      AboutSection(),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(
              'assets/images/dk.jpeg',
              // Replace with your profile image
            ),
          ),
          const SizedBox(height: 16),
          appText(
            title: 'Dharmendra Kumar',
            color: kTextColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 8),
          appText(
            title: 'Mobile App Developer',
            color: kGrey,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: contactEmail,
              );
              await launchUrl(emailLaunchUri);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              //backgroundColor: Colors.black,
            ),
            child: appText(
              title: 'Email me',
              color: kWhite,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  final Uri url = Uri.parse(instagram);
                  await launchUrl(url);
                },
                icon: const FaIcon(FontAwesomeIcons.instagram),
              ),
              IconButton(
                onPressed: () async {
                  final Uri url = Uri.parse(github);
                  await launchUrl(url);
                },
                icon: const FaIcon(FontAwesomeIcons.github),
              ),
              IconButton(
                onPressed: () async {
                  final Uri url = Uri.parse(linkedIN);
                  await launchUrl(url);
                },
                icon: const FaIcon(FontAwesomeIcons.linkedin),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          appText(
            title: 'About Me',
            color: kTextColor,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 20),
          appText(
            title: aboutWorkExperience,
            color: kTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(resumeLink);
                  await launchUrl(url);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: appText(
                  title: 'Resume',
                  color: kWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Portfolio(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: appText(
                  title: 'My Portfolio',
                  color: kWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
