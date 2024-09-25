import 'package:flutter/material.dart';
import 'package:untitled2/constants/constants.dart';
import 'package:untitled2/data/project_model.dart';
import 'package:untitled2/utils/app_text.dart';
import 'package:untitled2/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectWidget extends StatelessWidget {
  final Project projectData;

  const ProjectWidget({super.key, required this.projectData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenConstraint().width * 0.4,
      child: Card(
        color: kWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: kGrey,
                  size: 18,
                ),
                const SizedBox(
                  width: 10,
                ),
                appText(
                    title: projectData.name,
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: appText(
                  title: projectData.description,
                  color: kPrimaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          // const Spacer(),
          const Divider(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(projectData.link);
                  await launchUrl(url);
                },
                child: appText(
                    title: "View Project",
                    color: kWhite,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
