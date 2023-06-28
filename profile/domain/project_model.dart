// To parse this JSON data, do
//
//     final projectModel = projectModelFromMap(jsonString);

import 'dart:convert';

class ProjectModel {
    ProjectModel({
        required this.message,
         this.error,
         this.data,
    });

    String message;
    List<dynamic>? error;
    List<Project>? data;

    factory ProjectModel.fromJson(String str) => ProjectModel.fromMap(json.decode(str));



    factory ProjectModel.fromMap(Map<String, dynamic> json) => ProjectModel(
        message: json["message"],
        error: List<dynamic>.from(json["error"].map((x) => x)),
        data: List<Project>.from(json["data"].map((x) => Project.fromMap(x))),
    );


}

class Project {
    Project({
         this.id,
         this.userId,
         this.title,
         this.description,
         this.associatedUsers,
         this.image,
         this.assets,
    });

    String? id;
    String ?userId;
    String ?title;
    String ?description;
    List<String>? associatedUsers;
    String? image;
    List<String>? assets;

    factory Project.fromJson(String str) => Project.fromMap(json.decode(str));


    factory Project.fromMap(Map<String, dynamic> json) => Project(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        associatedUsers: List<String>.from(json["associated_users"].map((x) => x)),
        image: json["image"],
        assets: List<String>.from(json["assets"].map((x) => x)),
    );

    

}
