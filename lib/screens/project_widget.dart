import 'package:flutter/material.dart';
import 'package:untitled2/constants/constants.dart';
import 'package:untitled2/data/project_model.dart';
import 'package:untitled2/screens/project_details.dart';
import 'package:untitled2/utils/app_text.dart';

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
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Card(
                    elevation: 1,
                    color: kWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        project1.logo.toString(),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                appText(
                  title: project1.title,
                  color: kTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            const SizedBox(height: 10),
            appText(
              title: project1.description,
              color: kTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children: project1.technologies
                        .map((tech) => Chip(label: Text(tech)))
                        .toList(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjectDetails(
                            appName: project1.title,
                            description: project1.description,
                            appStoreLink: project1.appStoreLink,
                            playStoreLink: project1.playStoreLink,
                            logo: project1.logo.toString(),
                          ),
                        ));
                    // final Uri url = Uri.parse(project1.link);
                    // await launchUrl(url);
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
