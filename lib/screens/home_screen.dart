import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled2/constants/constants.dart';
import 'package:untitled2/data/data.dart';
import 'package:untitled2/screens/project_widget.dart';
import 'package:untitled2/utils/app_text.dart';
import 'package:untitled2/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<String> skillList = [
    "Flutter",
    "Android",
    "Dart",
    "Kotlin",
    "Java",
    "BLoC",
    "GetX",
    "Provider",
    "Firebase",
    "REST APIs",
    "Google Maps"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText(
          title: "My Portfolio",
          color: kWhite,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton<int>(
                    child: Row(
                      children: [
                        appText(
                          title: "Technologies",
                          color: kWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 22,
                          color: kWhite,
                        )
                      ],
                    ),
                    itemBuilder: (context) {
                      return List<PopupMenuItem<int>>.generate(
                        skillList.length,
                        (int index) {
                          return PopupMenuItem(
                            value: index,
                            child: appText(
                              title: skillList[index],
                              color: kTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      );
                    }),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(instagram);
                    await launchUrl(url);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: kWhite,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(github);
                    await launchUrl(url);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.github,
                    color: kWhite,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(linkedIN);
                    await launchUrl(url);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: kWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: kGradient1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            const SizedBox(height: 15),
            _buildProfileInfo(),
            const SizedBox(height: 20),
            _buildActionButtons(),
            const SizedBox(height: 10),
            _buildExperienceAndContact(context),
            const SizedBox(height: 10),
            _buildProjectsGrid(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgPath),
          fit: BoxFit.fill,
        ),
      ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(
              'assets/images/dk.jpeg',
              // Replace with your profile image
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        Center(
          child: appText(
            title: name,
            color: kTextColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: appText(
            title: profile,
            color: kGrey,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            final Uri url = Uri.parse(resumeLink);
            await launchUrl(url);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: appText(
            title: 'Resume',
            color: kWhite,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 10),
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
          ),
          child: appText(
            title: 'Email me',
            color: kWhite,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceAndContact(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenConstraint().width * 0.9,
        child: context.screenConstraint().width > 1200
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      flex: context.screenConstraint().width > 1200 ? 3 : 1,
                      child: _buildExperienceColumn(context)),
                  const SizedBox(width: 10),
                  Flexible(flex: 1, child: _buildContactCard()),
                ],
              )
            : Column(
                children: [
                  _buildExperienceColumn(context),
                  const SizedBox(height: 10),
                  _buildContactCard(),
                ],
              ),
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenConstraint().width * 0.9,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1000) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 2.0,
                ),
                itemCount: projectList.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project1: projectList[index]);
                },
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
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

  Widget _buildExperienceColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(
          title: 'About Me',
          color: kTextColor,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        appText(
          title: aboutWorkExperience,
          color: kTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(height: 12),
        const Divider(),
      ],
    );
  }

  Widget _buildContactCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContactInfo(
                title: "Location",
                value: location,
                iconData: FontAwesomeIcons.locationArrow),
            _buildContactInfo(
              title: "Email",
              value: email,
            ),
            _buildContactInfo(
              title: "Mobile",
              value: mobile,
            ),
            _buildContactInfo(
              title: "Date of Birth",
              value: dob,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo({
    required String title,
    required String value,
    IconData? iconData,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(
          title: title,
          color: kTextColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconData != null
                ? FaIcon(
                    iconData,
                    size: 15,
                  )
                : const SizedBox(),
            iconData != null ? const SizedBox(width: 5) : const SizedBox(),
            appText(
              title: value,
              color: kTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildLinkInfo(String title, String link) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(
          title: title,
          color: kTextColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () async {
            if (title == "Email") {
            } else {
              final Uri url = Uri.parse(link);
              await launchUrl(url);
            }
          },
          child: Row(
            children: [
              title == "Email"
                  ? appText(
                      title: link,
                      color: kTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    )
                  : appText(
                      title: title,
                      color: Colors.blue,
                      fontSize: 12,
                      textDecoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
              const SizedBox(width: 2),
              title == "Email"
                  ? const SizedBox()
                  : const Icon(Icons.launch, color: Colors.blue, size: 12),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
