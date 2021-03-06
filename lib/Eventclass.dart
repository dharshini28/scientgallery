class Eventclass {
  final int userId;
  final int id;
  final String title;
  final String body;

  Eventclass({this.userId, this.id, this.title,this.body});

  factory Eventclass.fromJson(Map<String, dynamic> json) {
    return Eventclass(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
