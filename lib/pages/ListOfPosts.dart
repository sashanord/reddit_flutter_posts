import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_flutter_posts/bloc/posts_bloc.dart';

class ListOfPostsPage extends StatelessWidget {
  const ListOfPostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: BlocProvider(
          create: (context) => PostsBloc()..add(PostsUpdate()),
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is PostsLoadSuccess) {
                return Scaffold(
                  body: RefreshIndicator(
                    child: ListView.separated(
                        itemCount: state.posts.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          var currentPost = state.posts[index];
                          List<Widget> list = [];
                          if (currentPost.thumbnail != "self") {
                            list.add(SizedBox(
                              child: Image.network(currentPost.thumbnail),
                              width: 100,
                              height: 100,
                            ));
                          }
                          list.add(Flexible(child: Text(currentPost.title)));
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/postCard',
                                  arguments: currentPost);
                            },
                            child: Card(
                              child: Row(
                                children: list,
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                          );
                        }),
                    onRefresh: () async {
                      BlocProvider.of<PostsBloc>(context).add(PostsUpdate());
                    },
                  ),
                );
              }
              if (state is PostsLoadFailure) {
                return Center(child: Text('ошибка'));
              }
              return const Scaffold(
                //экран загрузки на время загрузки
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )),
    );
  }
}
