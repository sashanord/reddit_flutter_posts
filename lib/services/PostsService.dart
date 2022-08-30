import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reddit_flutter_posts/models/Post.dart';

class PostsService {
  static Future<List<Post>> fetchPosts() async {
    var url = "http://reddit.com/r/flutterdev/new.json";
    try {
      final response = await http.get(Uri.parse(url));
      var rawList = (jsonDecode(response.body)['data']['children'] as List)
        ..getRange(0, 25);
      List<Post> list = [];
      for (var i = 0; i < rawList.length; i++) {
        list.add(Post.fromJson(rawList[i]['data']));
      }
      return list;
    } catch (_) {
      // в случае ошибки выбрасывается исключение
      throw Exception('Failed to load posts');
    }
  }
}
