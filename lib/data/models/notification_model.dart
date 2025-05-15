class NotificationModel {
  final int id;
  final String icon;
  final String title;
  final String content;
  final String date;

  NotificationModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.content,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      icon: json['icon'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}
