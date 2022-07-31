import 'package:desafio_esig/pages/details_page/details_page.dart';
import 'package:desafio_esig/widgets/button_navigation_bar/button_navigation_bar.dart';
import 'package:desafio_esig/widgets/button_navigation_bar_function/button_navigation_bar_function.dart';
import 'package:desafio_esig/widgets/card_home/card_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../../controllers/posts_controller/posts_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PostsController();
  final function = ButtonNavvigationBarFunction();

  _onItemTapped(int index) {
    function.onItemTapped(index);
  }

  // SUCCESS
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
              userId: '${posts.userId}',
              id: '${posts.id}',
              title: posts.title,
              body: posts.body,
              ontap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    id: posts.id.toString(),
                    userId: posts.userId.toString(),
                    title: posts.title,
                    body: posts.body,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ERROR
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

  // LOADING
  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  // START
  _start() {
    return Container();
  }

  // SWITCH CASE
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
        title: const Text('Posts List'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (ctx, child) {
          return stateManagement(controller.state.value);
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) => ButtonNavigationBarHomePage(
          selectedIndex: function.selectedIndex, //_selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
