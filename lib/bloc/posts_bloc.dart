import 'dart:developer' as developer;

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:reddit_flutter_posts/services/PostsService.dart';
import '../models/Post.dart';
part '../events/posts_event.dart';
part '../states/posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async{
      await makeEventToState(event);
    });
  }

  Future<void> makeEventToState(PostsEvent event) async {
    if (event is PostsUpdate) {
      emit(PostsLoadInProgress()); // посылаем состояние прогресс
      try {
        final list = await PostsService.fetchPosts();
        emit(PostsLoadSuccess(posts: list));
      } catch (_) { // в случае возникновения любой ошибки при запросах посылается состояние неуспеха
        emit(PostsLoadFailure());
      }
    }
  }
}

