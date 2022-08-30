class Post {
  String thumbnail;
  String title;
  String ups;
  String selftext;

  Post(
      {required this.thumbnail,
      required this.title,
      required this.ups,
      required this.selftext});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(thumbnail: json['thumbnail'],
        title: json['title'],
        ups: json['ups'].toString(),
        selftext: json['selftext']);
  }
}
