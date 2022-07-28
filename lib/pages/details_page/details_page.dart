import 'package:flutter/material.dart';
import '../../controllers/posts_controller/posts_controller.dart';

class DetailsPage extends StatelessWidget {
  final String id;
  DetailsPage({super.key, required this.id});

  final controller = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            var posts = controller.allPosts.elementAt(int.parse(id[index]));
            print(posts.title[index]);
            print(posts.body[index]);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(posts.title),
                Text(posts.userId.toString()),
                Text(posts.id.toString()),
                Text(posts.body),
              ],
            );
          },
        ),
      ),
    );
  }
}
