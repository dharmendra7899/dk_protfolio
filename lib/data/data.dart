import 'package:flutter/material.dart';
import 'package:untitled2/data/project_model.dart';

Color kGradient1 = Colors.purple;
Color kGradient2 = Colors.pinkAccent;

String imagePath = "images/personReview.png";

//String data to modify
String name = "Dharmendra Kumar";
String username = "dharmendra7899";

//Link to resume on Google Drive
String resumeLink =
    "https://drive.google.com/file/d/149-mFqIYt_nOILoicJsMatrNhn1pJEHz/view?usp=drivesdk";

//Contact Email
String contactEmail = "dharm.dk1999@gmail.com";

String aboutWorkExperience = '''
Driven Android App Developer with over 3 years of experience in Flutter Application development. Skilled in creating high-quality, intuitive mobile apps and integrating RESTful APIs and cloud services. Eager to contribute to dynamic projects and collaborate with a talented team.
''';

String aboutMeSummary = '''
Dharmendra is a content creator and has over 5K subscribers on YouTube and a 700+ member community on Discord. 
📺 YouTube Channel: watch.dharmendra.in
🚀 Discord Community: discord.dharmendra.in
''';

String location = "Lucknow, India";
String linkedIN =
    "https://www.linkedin.com/authwall?trk=gf&trkInfo=AQFfue-tiZVuTgAAAZIjACjQtJ_IzHchDcqxgJP0eEEX5KfB7FYajp_J63qXR9GSnzHBAvnJvKCZVCz8ZRyi7yKpOgEZtJOIuJd_6EFxpbDyR_K70f1ti3oJTGVGyQcsar4vAas=&original_referer=https://www.google.com/&sessionRedirect=https%3A%2F%2Fwww.linkedin.com%2Fin%2Fdharmendra-kumar-flutter-developer";
String github = "https://github.com/dharmendra7899";
String email = "dharm.dk1999@gmail.com";

List<Project> projectList = [
  Project(
      name: "Shades",
      description:
          "Winner IEEE Mandi 'Go Online' Challenge at Electrothon, NIT Hamirpur.",
      link: "https://github.com/adityathakurxd/shades"),
  Project(
      name: "Fiasco",
      description:
          "Fiasco is one stop solution to help you manage Family expenses in one place!",
      link: "https://github.com/adityathakurxd/fiasco"),
  Project(
      name: "Fiasco",
      description:
          "Fiasco is one stop solution to help you manage Family expenses in one place!",
      link: "https://github.com/adityathakurxd/fiasco"),
  Project(
      name: "Flutter Portfolio",
      description: "A template for Portfolio",
      link: "https://github.com/adityathakurxd/flutter-portfolio")
];
