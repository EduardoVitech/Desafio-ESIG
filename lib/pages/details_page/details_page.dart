import 'dart:ui';

import 'package:flutter/material.dart';
import '../../controllers/posts_controller/posts_controller.dart';

class DetailsPage extends StatelessWidget {
  final String id;
  final String userId;
  final String title;
  final String body;

  DetailsPage({
    super.key,
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  final controller = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Title: $title',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'User ID: $userId',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'ID: $id',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Body: $body',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
