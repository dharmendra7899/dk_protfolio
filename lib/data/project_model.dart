class Project {
  final String title;
  final String description;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? logo;
  final List<String> technologies;

  Project({
    required this.title,
    required this.description,
    required this.logo,
    this.appStoreLink,
    this.playStoreLink,
    required this.technologies,
  });
}
