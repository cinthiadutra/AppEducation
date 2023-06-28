import 'dart:convert';

class Challenge {
  String imageUrl;
  String title;
  String contentText;
  bool? isChecked;
  int totalComents;

  Challenge({
    required this.imageUrl,
    required this.title,
    required this.contentText,
    required this.isChecked,
    required this.totalComents
  });

  @override
  String toString() {
    return 'Challenge(imageUrl: $imageUrl, title: $title, contentText: $contentText, isChecked: $isChecked), total_comments:$totalComents"';
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'contentText': contentText,
      'isChecked': isChecked,
      'total_comments': totalComents
    };
  }

  factory Challenge.fromMap(Map<String, dynamic> map) {
    return Challenge(
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? '',
      contentText: map['contentText'] ?? '',
      isChecked: map['isChecked'] ?? false,
      totalComents: map['total_comments"']??0
    );
  }

  String toJson() => json.encode(toMap());

  factory Challenge.fromJson(String source) =>
      Challenge.fromMap(json.decode(source));
}
