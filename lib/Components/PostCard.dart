import 'package:flutter/material.dart';
import '../models/Post.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Post;
    return Scaffold(
      appBar: AppBar(
        title: Text('More information'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(child: Text(args.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
          Text('Pluses: ${args.ups}',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15),),
          Expanded(
              flex: 1,
              child:SingleChildScrollView(child: Text(args.selftext, style: TextStyle(fontSize: 17 ),)))
        ],
      ),
    );
  }
}
