import 'package:desafio_esig/models/posts_model/posts_model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class Postsrepository {
  Dio dio = Dio();

  Future<List<PostsModel>> fetchAllPosts() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    final listposts = response.data;

    List<PostsModel> posts = [];
    for (var json in listposts) {
      final allPosts = PostsModel.fromMap(json);
      posts.add(allPosts);
    }
    return posts;
  }
}
