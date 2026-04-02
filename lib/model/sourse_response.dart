class SourseResponse {
  String? status;
  List<Source>? sources;
  String? message;
  String? code;

  SourseResponse({this.status, this.sources, this.message, this.code});

  SourseResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["sources"] is List) {
      sources = json["sources"] == null
          ? null
          : (json["sources"] as List).map((e) => Source.fromJson(e)).toList();
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["code"] is String) {
      code = json["code"];
    }
  }

  static List<SourseResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(SourseResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    if (sources != null) {
      data["sources"] = sources?.map((e) => e.toJson()).toList();
    }
    data["message"] = message;
    data["code"] = code;
    return data;
  }
}

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Source(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  Source.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["language"] is String) {
      language = json["language"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
  }

  static List<Source> fromList(List<Map<String, dynamic>> list) {
    return list.map(Source.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["url"] = url;
    data["category"] = category;
    data["language"] = language;
    data["country"] = country;
    return data;
  }
}
