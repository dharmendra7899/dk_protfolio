import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled2/constants/constants.dart';
import 'package:untitled2/data/data.dart';
import 'package:untitled2/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_text.dart';

class ProjectDetails extends StatelessWidget {
  final String appName;
  final String description;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? stateManagement;
  final String logo;

  const ProjectDetails(
      {super.key,
      required this.appName,
      required this.description,
      required this.logo,
      this.appStoreLink,
      this.playStoreLink,
      this.stateManagement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kWhite,
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          projectInfo(context),
          const SizedBox(
            height: 10,
          ),
          playStoreLink != "" || appStoreLink != ""
              ? downloadAppInfo(context)
              : const SizedBox(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget projectInfo(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenConstraint().width * 0.9,
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
                        logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                appText(
                  title: appName,
                  color: kTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            const SizedBox(height: 10),
            appText(
              title: description,
              color: kTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 12),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget downloadAppInfo(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenConstraint().width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            appText(
              title: "DOWNLOAD OUR APP",
              color: kTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                appStoreLink != ''
                    ? GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse(appStoreLink ?? '');
                          await launchUrl(url);
                        },
                        child: Card(
                          elevation: 1,
                          color: kBlack,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.apple,
                                  color: kWhite,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appText(
                                      title: "Download on the",
                                      color: kWhite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 2),
                                    appText(
                                      title: "App Store",
                                      color: kWhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  width: 20,
                ),
                playStoreLink != ""
                    ? GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse(playStoreLink ?? "");
                          await launchUrl(url);
                        },
                        child: Card(
                          elevation: 1,
                          color: kBlack,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/play.png",
                                  height: 25,
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appText(
                                      title: "Download on the",
                                      color: kWhite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(height: 2),
                                    appText(
                                      title: "Google Play",
                                      color: kWhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(
                        width: 20,
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
