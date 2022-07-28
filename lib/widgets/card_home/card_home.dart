import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final String id;
  final String title;
  final Function()? ontap;
  const CardHome({
    super.key,
    required this.id,
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: 4,
        child: ListTile(
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
        ),
      ),
    );
  }
}
