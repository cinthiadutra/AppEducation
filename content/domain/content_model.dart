// To parse this JSON data, do
//
//     final content = contentFromMap(jsonString);

import 'dart:convert';

class ContentModel {
  ContentModel({
    required this.message,
    this.error,
    this.data,
  });

  final String message;
  final List<String>? error;
  final List<ContentDetail>? data;

  @override
  String toString() =>
      'ContentModel(message: $message, error: $error, data: $data)';

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'error': error,
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
      message: map['message'] ?? '',
      error: List<String>.from(map['error']),
      data: map['data'] != null
          ? List<ContentDetail>.from(
              map['data']?.map((x) => ContentDetail.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentModel.fromJson(String source) =>
      ContentModel.fromMap(json.decode(source));
}

class ContentDetail {
  final String? id;
  final String? contentDetailId;
  final String? title;
  final String? description;
  final String? type;
  final String? thumbnail;
  final String? contentMediaType;
  final String? contentMedia;
  final List<PointsSkill>? pointsSkills;
  final bool? isActive;
  final String? dateTimeCreated;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final List<Comment>? comments;
  final int? totalComments;
  final String? contentDetailDateTimeCreated;
  final bool? allowComments;
   bool isUserCompleted;
  ContentDetail({
    this.id,
    this.contentDetailId,
    this.title,
    this.description,
    this.type,
    this.thumbnail,
    this.contentMediaType,
    this.contentMedia,
    this.pointsSkills,
    this.isActive,
    this.dateTimeCreated,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.comments,
    this.totalComments,
    this.contentDetailDateTimeCreated,
    this.allowComments,
    required this.isUserCompleted
  });

  factory ContentDetail.fromJson(String str) =>
      ContentDetail.fromMap(json.decode(str));

  factory ContentDetail.fromMap(Map<String, dynamic> map) => ContentDetail(
        id: map["id"],
        contentDetailId: map["id"],
        title: map["title"],
        description: map["description"],
        type: map["type"],
        thumbnail: map["thumbnail"],
        contentMediaType: map["content_media_type"],
        contentMedia: map["content_media"],
        pointsSkills: map['points_skills'] != null
            ? List<PointsSkill>.from(
                map['points_skills']?.map((x) => PointsSkill.fromMap(x)))
            : null,
        isActive: map["isActive"],
        isUserCompleted: map["isUserCompleted"],
        dateTimeCreated: map["dateTimeCreated"],
        createdAt: map["createdAt"],
        updatedAt: map["updatedAt"],
        v: map["__v"],
        comments: map['omments'] != null
            ? List<Comment>.from(map['omments']?.map((x) => Comment.fromMap(x)))
            : null,
        totalComments: map["total_comments"],
        contentDetailDateTimeCreated: map["date_time_created"],
        allowComments: map["allowComments"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "id": contentDetailId,
        "title": title,
        "description": description,
        "type": type,
        "thumbnail": thumbnail,
        "content_media_type": contentMediaType,
        "content_media": contentMedia,
        "points_skills": pointsSkills?.map((x) => x.toMap()).toList(),
        "isActive": isActive,
        "dateTimeCreated": dateTimeCreated,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "comments": comments?.map((x) => x.toMap()).toList(),
        "total_comments": totalComments,
        "date_time_created": contentDetailDateTimeCreated,
        "allowComments": allowComments,
        "isUserCompleted": isUserCompleted
      };

  ContentDetail copyWith({
    String? id,
    String? contentDetailId,
    String? title,
    String? description,
    String? type,
    String? thumbnail,
    String? contentMediaType,
    String? contentMedia,
    List<PointsSkill>? pointsSkills,
    bool? isActive,
    String? dateTimeCreated,
    String? createdAt,
    String? updatedAt,
    int? v,
    List<Comment>? comments,
    int? totalComments,
    String? contentDetailDateTimeCreated,
    bool? allowComments,
    bool? isUserCompleted,
  }) {
    return ContentDetail(
      id: id ?? this.id,
      contentDetailId: contentDetailId ?? this.contentDetailId,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      thumbnail: thumbnail ?? this.thumbnail,
      contentMediaType: contentMediaType ?? this.contentMediaType,
      contentMedia: contentMedia ?? this.contentMedia,
      pointsSkills: pointsSkills ?? this.pointsSkills,
      isActive: isActive ?? this.isActive,
      dateTimeCreated: dateTimeCreated ?? this.dateTimeCreated,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      comments: comments ?? this.comments,
      totalComments: totalComments ?? this.totalComments,
      contentDetailDateTimeCreated: contentDetailDateTimeCreated ?? this.contentDetailDateTimeCreated,
      allowComments: allowComments ?? this.allowComments,
      isUserCompleted: isUserCompleted ?? this.isUserCompleted,
    );
  }
}

class Comment {
  final String? id;
  final String? commentId;
  final String? entityAnchorId;
  final String? entityAnchorType;
  final String? userId;
  final String? message;
  final String? dateCreated;
  final String? timeCreated;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  Comment({
    this.id,
    this.entityAnchorId,
    this.entityAnchorType,
    this.userId,
    this.message,
    this.dateCreated,
    this.timeCreated,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.commentId,
  });

  @override
  String toString() {
    return 'Comment(id: $id, commentId: $commentId, entityAnchorId: $entityAnchorId, entityAnchorType: $entityAnchorType, userId: $userId, message: $message, dateCreated: $dateCreated, timeCreated: $timeCreated, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'commentId': commentId,
      'entityAnchorId': entityAnchorId,
      'entityAnchorType': entityAnchorType,
      'userId': userId,
      'message': message,
      'dateCreated': dateCreated,
      'timeCreated': timeCreated,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'v': v,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
        id: json["_id"],
        commentId: json["id"],
        entityAnchorId: json["entity_anchor_id"],
        entityAnchorType: json["entity_anchor_type"],
        userId: json["user_id"],
        message: json["message"],
        dateCreated: json["date_created"],
        timeCreated: json["time_created"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));
}

class PointsSkill {
  PointsSkill({
    this.skillTitle,
    this.skillImage,
    this.skillId,
    this.skillExperienceIncrease,
  });

  final String? skillId;
  final int? skillExperienceIncrease;
  final String? skillTitle;
  final String? skillImage;

  factory PointsSkill.fromJson(String str) =>
      PointsSkill.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PointsSkill.fromMap(Map<String, dynamic> json) => PointsSkill(
        skillTitle: json["skill_title"],
        skillImage: json["skill_image"],
        skillId: json["skill_id"],
        skillExperienceIncrease: json["skill_experience_increase"],
      );

  Map<String, dynamic> toMap() => {
        "skill_id": skillId,
        "skill_experience_increase": skillExperienceIncrease,
        "skill_title": skillTitle,
        "skill_image": skillImage,
      };
}
