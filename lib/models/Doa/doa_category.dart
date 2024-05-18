class DoaCategory {
  final String title;
  final String icon;
  final int count;

  DoaCategory({
    required this.title,
    required this.icon,
    required this.count,
  });

  factory DoaCategory.fromJson(Map<String, dynamic> json) {
    return DoaCategory(
      title: json['title'],
      icon: json['icon'],
      count: json['count'],
    );
  }
}
