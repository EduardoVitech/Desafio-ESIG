import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final String id;
  final String title;
  final String userId;
  final Function()? ontap;
  const CardHome({
    super.key,
    required this.id,
    required this.title,
    required this.ontap,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    //bool isFavorite = false;

    return Card(
      elevation: 4,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 39, 3, 83),
              child: Center(
                child: Text(userId),
              ),
            ),
            title: Text(
              'Post: $id',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              'Title: $title',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: IconButton(
              onPressed: ontap,
              icon: const Icon(Icons.bookmarks),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  /* setState(() {
                    isFavorite = !isFavorite;
                  }); */
                },
                icon: const Icon(
                  Icons.favorite_border,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.messenger_outline_sharp,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
