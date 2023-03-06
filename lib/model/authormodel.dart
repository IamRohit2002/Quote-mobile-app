// To parse this JSON data, do
//
//     final authorModel = authorModelFromJson(jsonString);

import 'dart:convert';

class AuthorModel {
  AuthorModel({
    this.id,
    this.name,
    this.link,
    this.bio,
    this.description,
    this.quoteCount,
    this.slug,
    this.dateAdded,
    this.dateModified,
  });

  String? id;
  String? name;
  String? link;
  String? bio;
  String? description;
  int? quoteCount;
  String? slug;
  DateTime? dateAdded;
  DateTime? dateModified;

  factory AuthorModel.fromRawJson(String str) =>
      AuthorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
        id: json["_id"],
        name: json["name"],
        link: json["link"],
        bio: json["bio"],
        description: json["description"],
        quoteCount: json["quoteCount"],
        slug: json["slug"],
        dateAdded: json["dateAdded"] == null
            ? null
            : DateTime.parse(json["dateAdded"]),
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.parse(json["dateModified"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "link": link,
        "bio": bio,
        "description": description,
        "quoteCount": quoteCount,
        "slug": slug,
        "dateAdded":
            "${dateAdded!.year.toString().padLeft(4, '0')}-${dateAdded!.month.toString().padLeft(2, '0')}-${dateAdded!.day.toString().padLeft(2, '0')}",
        "dateModified":
            "${dateModified!.year.toString().padLeft(4, '0')}-${dateModified!.month.toString().padLeft(2, '0')}-${dateModified!.day.toString().padLeft(2, '0')}",
      };
}
