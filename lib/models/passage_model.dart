class PassageModel {
  Bible? bible;

  PassageModel({this.bible});

  PassageModel.fromJson(Map<String, dynamic> json) {
    bible = json['bible'] != null ? Bible.fromJson(json['bible']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bible != null) {
      data['bible'] = bible!.toJson();
    }
    return data;
  }
}

class Bible {
  String? title;
  Book? book;

  Bible({this.title, this.book});

  Bible.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    book = json['book'] != null ? Book.fromJson(json['book']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (book != null) {
      data['book'] = book!.toJson();
    }
    return data;
  }
}

class Book {
  String? name;
  String? bookId;
  String? title;
  Chapter? chapter;

  Book({this.name, this.bookId, this.title, this.chapter});

  Book.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bookId = json['book_id'];
    title = json['title'];
    chapter =
        json['chapter'] != null ? Chapter.fromJson(json['chapter']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['book_id'] = bookId;
    data['title'] = title;
    if (chapter != null) {
      data['chapter'] = chapter!.toJson();
    }
    return data;
  }
}

class Chapter {
  String? chap;
  List<Verses>? verses;

  Chapter({this.chap, this.verses});

  Chapter.fromJson(Map<String, dynamic> json) {
    chap = json['chap'];
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chap'] = chap;
    if (verses != null) {
      data['verses'] = verses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Verses {
  String? number;
  String? title;
  String? text;

  Verses({this.number, this.title, this.text});

  Verses.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['title'] = title;
    data['text'] = text;
    return data;
  }
}
