part of '../bloc/posts_bloc.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoadInProgress extends PostsState{}

class PostsLoadSuccess extends PostsState {
  final List<Post> posts;
  PostsLoadSuccess({required this.posts});
}

class PostsLoadFailure extends PostsState {}