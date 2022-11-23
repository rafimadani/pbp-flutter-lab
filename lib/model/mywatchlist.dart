// To parse this JSON data, do
//
//     final myWatchList = myWatchListFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

List<MyWatchList> myWatchListFromJson(String str) => List<MyWatchList>.from(json.decode(str).map((x) => MyWatchList.fromJson(x)));

String myWatchListToJson(List<MyWatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
  MyWatchList({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  Watched watched;
  String title;
  String rating;
  String releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    watched: watchedValues.map[json["watched"]]!,
    title: json["title"],
    rating: json["rating"],
    releaseDate: json["release_date"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "watched": watched,
    "title": title,
    "rating": rating,
    "release_date": releaseDate,
    "review": review,
  };
}



Future<List<MyWatchList>> fetchMyWatchlist() async  {
  var url = Uri.parse('https://pbp-project-2.herokuapp.com/mywatchlist/json/');

  final response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  if (response.statusCode != 200) {
    throw Exception("Failed to load list.");
  }

  final data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MyWatchList> list = [];
  for (var d in data) {
    if (d != null) {
      list.add(MyWatchList.fromJson(d));
    }
  }

  return list;
  }
enum Watched { YES, NO }

final watchedValues = EnumValues({
  "No": Watched.NO,
  "Yes": Watched.YES
});

enum Model { MYWATCHLIST_MOVIESITEM }

final modelValues = EnumValues({
  "mywatchlist.moviesitem": Model.MYWATCHLIST_MOVIESITEM
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
