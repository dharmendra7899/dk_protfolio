import 'package:flutter/material.dart';

import 'package:untitled2/constants/constants.dart';
import 'package:untitled2/data/data.dart';
import 'package:untitled2/screens/project_widget.dart';
import 'package:untitled2/utils/app_text.dart';
import 'package:untitled2/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText(
          title: "Portfolio",
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: kGradient1,
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            const SizedBox(height: 15),
            _buildProfileInfo(),
            const SizedBox(height: 10),
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
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(imagePath),
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
            color: const Color(0xff120F1B),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Center(
          child: appText(
            title: profile,
            color: kPrimaryColor,
            fontSize: 12,
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
        OutlinedButton(
          onPressed: () async {
            final Uri url = Uri.parse(resumeLink);
            await launchUrl(url);
          },
          child: appText(
            title: "View Resume",
            color: kPrimaryColor,
            fontSize: 12,
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
          child: Row(
            children: [
              const Icon(Icons.add, size: 14, color: Colors.white),
              const SizedBox(width: 2),
              appText(
                title: "Contact",
                color: kWhite,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceAndContact(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenConstraint().width * 0.8,
        child: context.screenConstraint().width > 1200
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(flex: context.screenConstraint().width > 1200 ? 3 : 1,
                child: _buildExperienceColumn(context)),
            const SizedBox(width: 10),
            Flexible(flex: 1,
                child: _buildContactCard()),
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


  Widget _buildProjectsGrid1(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: GridView.count(
          padding: const EdgeInsetsDirectional.only(top: 5),
          crossAxisCount: context.screenConstraint().width > 1000?2:1,
          shrinkWrap: true,
          childAspectRatio:context.screenConstraint().width > 1000?2.310:0.97,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate( projectList.length ,
                (productIndex) {
              return SizedBox(
                  child: ProjectWidget(projectData: projectList[productIndex])
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.8,
        child: GridView.count(
          padding: const EdgeInsetsDirectional.only(top: 5),
          crossAxisCount: screenWidth > 1300 ? 3 : screenWidth > 600?2:1,
          shrinkWrap: true,
          childAspectRatio: _calculateChildAspectRatio(screenWidth, screenHeight),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(projectList.length, (productIndex) {
            return SizedBox(
              child: ProjectWidget(projectData: projectList[productIndex]),
            );
          }),
        ),
      ),
    );
  }

  double _calculateChildAspectRatio(double screenWidth, double screenHeight) {
    if (screenWidth > 1200 ) {
      return 1.2;
    } else if (screenWidth > 600) {
      return 1.56;
    } else {
      return 0.97;
    }
  }




  Widget _buildExperienceColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(
          title: "Experience",
          color: kTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        appText(
          title: aboutWorkExperience,
          color: kTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 12),
        const Divider(),
      ],
    );
  }

  Widget _buildContactCard() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContactInfo("Location", location),
            _buildLinkInfo("LinkedIn", linkedIN),
            _buildLinkInfo("Github", github),
            _buildLinkInfo("Email", email),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(String title, String value) {
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
          children: [
            const Icon(Icons.location_on, size: 16),
            const SizedBox(width: 2),
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
            final Uri url = Uri.parse(link);
            await launchUrl(url);
          },
          child: Row(
            children: [
              appText(
                title: title,
                color: Colors.blue,
                fontSize: 12,
                textDecoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(width: 2),
              const Icon(Icons.launch, color: Colors.blue, size: 12),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }



}
