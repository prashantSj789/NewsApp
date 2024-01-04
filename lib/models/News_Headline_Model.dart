class News_Headline_Model {
  String? _status;
  int? _totalResults;
  List<Articles>? _articles;

  News_Headline_Model(
      {String? status, int? totalResults, List<Articles>? articles}) {
    if (status != null) {
      _status = status;
    }
    if (totalResults != null) {
      _totalResults = totalResults;
    }
    if (articles != null) {
      _articles = articles;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  int? get totalResults => _totalResults;
  set totalResults(int? totalResults) => _totalResults = totalResults;
  List<Articles>? get articles => _articles;
  set articles(List<Articles>? articles) => _articles = articles;

  News_Headline_Model.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['articles'] != null) {
      _articles = <Articles>[];
      json['articles'].forEach((v) {
        _articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = _status;
    data['totalResults'] = _totalResults;
    if (_articles != null) {
      data['articles'] = _articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  Articles(
      {Source? source,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content}) {
    if (source != null) {
      _source = source;
    }
    if (author != null) {
      _author = author;
    }
    if (title != null) {
      _title = title;
    }
    if (description != null) {
      _description = description;
    }
    if (url != null) {
      _url = url;
    }
    if (urlToImage != null) {
      _urlToImage = urlToImage;
    }
    if (publishedAt != null) {
      _publishedAt = publishedAt;
    }
    if (content != null) {
      _content = content;
    }
  }

  Source? get source => _source;
  set source(Source? source) => _source = source;
  String? get author => _author;
  set author(String? author) => _author = author;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get urlToImage => _urlToImage;
  set urlToImage(String? urlToImage) => _urlToImage = urlToImage;
  String? get publishedAt => _publishedAt;
  set publishedAt(String? publishedAt) => _publishedAt = publishedAt;
  String? get content => _content;
  set content(String? content) => _content = content;

  Articles.fromJson(Map<String, dynamic> json) {
    _source =
        json['source'] != null ? Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_source != null) {
      data['source'] = _source!.toJson();
    }
    data['author'] = _author;
    data['title'] = _title;
    data['description'] = _description;
    data['url'] = _url;
    data['urlToImage'] = _urlToImage;
    data['publishedAt'] = _publishedAt;
    data['content'] = _content;
    return data;
  }
}

class Source {
  String? _id;
  String? _name;

  Source({String? id, String? name}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;

  Source.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    return data;
  }
}
