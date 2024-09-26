import 'package:flutter/material.dart';
import 'package:untitled2/data/project_model.dart';

Color kGradient1 = const Color(0xff120F1B);
Color kGradient2 = const Color(0xff1a1726);

String imagePath = "images/personReview.png";
String bgPath = "images/bg.jpg";

String name = "Dharmendra Kumar";
String profile = "Mobile Application Developer";

String resumeLink =
    "https://drive.google.com/file/d/149-mFqIYt_nOILoicJsMatrNhn1pJEHz/view?usp=drivesdk";

String contactEmail = "dharm.dk1999@gmail.com";

String aboutWorkExperience = '''
Passionate Mobile App Developer with 3+ years of hands-on experience in crafting innovative, user-centric Android applications. Proficient in building seamless, high-performance apps with integrated RESTful APIs and cloud services. Adept at solving complex challenges and transforming ideas into sleek, functional mobile solutions. Thrives in collaborative environments and is driven by a love for cutting-edge technologies and delivering exceptional user experiences.
''';

String location = "Lucknow, India";
String linkedIN =
    "https://www.linkedin.com/authwall?trk=gf&trkInfo=AQFfue-tiZVuTgAAAZIjACjQtJ_IzHchDcqxgJP0eEEX5KfB7FYajp_J63qXR9GSnzHBAvnJvKCZVCz8ZRyi7yKpOgEZtJOIuJd_6EFxpbDyR_K70f1ti3oJTGVGyQcsar4vAas=&original_referer=https://www.google.com/&sessionRedirect=https%3A%2F%2Fwww.linkedin.com%2Fin%2Fdharmendra-kumar-flutter-developer";
String github = "https://github.com/dharmendra7899";
String instagram =
    "https://www.instagram.com/mr_dharmendr06/?igsh=cTk1bmtrZWZrMzg1";
String email = "dharm.dk1999@gmail.com";
List<Project> projectList = [
  Project(
      name: "OneVasco",
      description:
          "Your gateway to effortless travel! Available on both Play Store and App Store, OneVasco revolutionizes the e-Visa application process with its user-friendly design and streamlined functionality. With just a few taps, users can apply for visas, track their application status, and receive real-time updates, all from the palm of their hand. Enhanced with secure payment integration and multilingual support, OneVasco empowers travelers worldwide to navigate the visa process with confidence and ease.",
      link: "https://github.com/dharmendra7899/merchant_aap.git"),
  Project(
    name: "PIPOnet",
    description:
        "Stay on track with real-time train status updates at your fingertips! Available for download, PIPOnet simplifies your travel experience by providing accurate information on train locations, schedules, and delays. With an intuitive interface and instant notifications, users can effortlessly check 'Where is my train?' and plan their journeys with confidence. Whether you're a daily commuter or an occasional traveler, PIPOnet ensures you never miss a beat on your rail adventures!",
    link: "https://github.com/dharmendra7899/merchant_aap.git",
  ),
  Project(
    name: "Rb Restaurant",
    description:
        "Savor the flavors of your favorite dishes right from your device! Designed for food lovers, the RB Restaurant app makes online food ordering a breeze. Browse through an extensive menu filled with delicious options, customize your orders, and enjoy seamless payment options. With real-time order tracking and prompt delivery, satisfying your cravings has never been easier. Whether you're at home or on the go, RB Restaurant brings culinary delights to your doorstep, ensuring a delightful dining experience every time!",
    link: "https://github.com/dharmendra7899/merchant_aap.git",
  ),
  Project(
    name: "Shop Sasta",
    description:
        "Your ultimate grocery shopping companion in Pune! Tailored for convenience and affordability, Shop Sasta offers a wide range of everyday essentials at unbeatable prices. With an easy-to-navigate interface, users can effortlessly browse through fresh produce, pantry staples, and household items, all from the comfort of their homes. Enjoy fast delivery right to your doorstep, exclusive deals, and personalized recommendations that make shopping a breeze. Experience the future of grocery shopping with Shop Sasta, where quality meets affordability in Pune!",
    link: "https://github.com/dharmendra7899/merchant_aap.git",
  ),
  Project(
    name: "CloseToBuy",
    description: "A template for Portfolio",
    link: "https://github.com/dharmendra7899/merchant_aap.git",
  ),
  Project(
    name: "Mechmiles Customer",
    description:
        "Your go-to destination for all vehicle spare parts and services, now available on both the App Store and Play Store! Designed for car enthusiasts and everyday drivers alike, MechMiles offers a comprehensive range of high-quality spare parts, tools, and maintenance services right at your fingertips. With an intuitive interface, users can easily browse and order parts, book services, and track their orders in real-time. Enjoy the convenience of reliable service and expert support, ensuring your vehicle is always in top condition. Drive with confidence and keep your vehicle running smoothly with MechMiles!",
    link: "https://github.com/dharmendra7899/merchant_aap.git",
  ),
  Project(
    name: "Mechmiles POS",
    description:
        "Your go-to destination for all vehicle spare parts and services, now available on both the App Store and Play Store! Designed for car enthusiasts and everyday drivers alike, MechMiles offers a comprehensive range of high-quality spare parts, tools, and maintenance services right at your fingertips. With an intuitive interface, users can easily browse and order parts, book services, and track their orders in real-time. Enjoy the convenience of reliable service and expert support, ensuring your vehicle is always in top condition. Drive with confidence and keep your vehicle running smoothly with MechMiles!",
    link: "https://github.com/dharmendra7899/merchant_aap.git",
  )
];
