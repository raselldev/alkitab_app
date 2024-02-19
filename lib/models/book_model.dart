class BookModel {
  List<BookData>? data;
  BookModel({this.data});

  BookModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BookData>[];
      json['data'].forEach((v) {
        data!.add(BookData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookData {
  int? id;
  String? abbr;
  String? name;
  int? chapter;

  BookData({this.id, this.abbr, this.name, this.chapter});

  BookData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    abbr = json['abbr'];
    name = json['name'];
    chapter = json['chapter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['abbr'] = abbr;
    data['name'] = name;
    data['chapter'] = chapter;
    return data;
  }
}
