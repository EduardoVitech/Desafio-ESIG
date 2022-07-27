import 'package:flutter/material.dart';
import '../../controllers/posts_controller/posts_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PostsController();

  _success() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1,
      child: ListView.builder(
        itemCount: controller.allPosts.length,
        itemBuilder: (ctx, index) {
          var posts = controller.allPosts[index];
          return Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 5,
              right: 5,
            ),
            //
            //
            //
            // colocar esse card em outra pasta
            //  |||||||||||
            //  VVVVVVVVVVV
            //
            child: InkWell(
              onTap: () {},
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text(
                    'Post: ${posts.id}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    'Title: ${posts.title}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: const Text('Tentar Novamente'),
      ),
    );
  }

  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  stateManagement(PostsState state) {
    switch (state) {
      case PostsState.start:
        return _start();
      case PostsState.loading:
        return _loading();
      case PostsState.error:
        return _error();
      case PostsState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de posts'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (ctx, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
