import 'package:flutter/widgets.dart';
import '../../models/posts_model/posts_model.dart';
import '../../repository/posts_repository/posts_repository.dart';

class PostsController {
  List<PostsModel> allPosts = [];
  final Postsrepository _repository;
  final state = ValueNotifier<PostsState>(PostsState.start);

  //PostsState state = PostsState.start;

  PostsController([Postsrepository? repository])
      : _repository = repository ?? Postsrepository();

  Future start() async {
    state.value = PostsState.loading;
    try {
      allPosts = await _repository.fetchAllPosts();
      state.value = PostsState.success;
    } catch (e) {
      state.value = PostsState.error;
    }
  }
}

enum PostsState { start, loading, success, error }
