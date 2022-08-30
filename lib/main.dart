import 'package:flutter/material.dart';
import 'package:reddit_flutter_posts/pages/ListOfPosts.dart';
import 'Components/PostCard.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => ListOfPostsPage(),
       '/postCard': (context) => PostCard(),
    },
  ));
}
