import 'package:desafio_esig/pages/details_page/details_page.dart';
import 'package:desafio_esig/widgets/card_home/card_home.dart';
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
            child: CardHome(
              id: '${posts.id}',
              title: posts.title,
              ontap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    id: posts.id.toString(),
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
