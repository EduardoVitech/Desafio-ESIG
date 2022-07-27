import 'package:dio/dio.dart';
import 'dart:convert';

import '../../../../models/posts_model/posts_model.dart';

class Postsrepository {
  var url = 'https://jsonplaceholder.typicode.com/posts';
  Dio dio = Dio();

  Future<List<PostsModel>> fetchAllPosts() async {
    final response = await dio.get(url);
    final listposts = jsonDecode(response.data);

    List<PostsModel> posts = [];
    for (var json in listposts) {
      final allPosts = PostsModel.fromMap(json);
      posts.add(allPosts);
    }
    return posts;
  }
}
