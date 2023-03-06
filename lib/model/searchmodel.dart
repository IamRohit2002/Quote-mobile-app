import 'dart:convert';

class SearchModel {
  SearchModel({
    this.id,
    this.content,
    this.author,
    this.tags,
    this.authorId,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  String? id;
  String? content;
  String? author;
  List<String>? tags;
  String? authorId;
  String? authorSlug;
  int? length;
  DateTime? dateAdded;
  DateTime? dateModified;

  factory SearchModel.fromRawJson(String str) =>
      SearchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json["_id"],
        content: json["content"],
        author: json["author"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        authorId: json["authorId"],
        authorSlug: json["authorSlug"],
        length: json["length"],
        dateAdded: json["dateAdded"] == null
            ? null
            : DateTime.parse(json["dateAdded"]),
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.parse(json["dateModified"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "author": author,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "authorId": authorId,
        "authorSlug": authorSlug,
        "length": length,
        "dateAdded":
            "${dateAdded!.year.toString().padLeft(4, '0')}-${dateAdded!.month.toString().padLeft(2, '0')}-${dateAdded!.day.toString().padLeft(2, '0')}",
        "dateModified":
            "${dateModified!.year.toString().padLeft(4, '0')}-${dateModified!.month.toString().padLeft(2, '0')}-${dateModified!.day.toString().padLeft(2, '0')}",
      };
}
