import 'package:desafio_esig/widgets/exchange_favorite_button/exchange_favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CardHome extends StatelessWidget {
  final String id;
  final String title;
  final String body;
  final String userId;
  final Function()? ontap;
  const CardHome({
    super.key,
    required this.id,
    required this.title,
    required this.body,
    required this.ontap,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final exchange = ExchangeFavoriteButton();

    return Card(
      elevation: 4,
      child: Column(
        children: [
          ListTile(
            // CIRCLE AVATAR
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 121, 15, 252),
              child: Center(
                child: Text(
                  'U$userId',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // USER ID
            title: Text(
              '@User$userId',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            // POSTS ID
            subtitle: Text(
              'id $id',
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
            // BUTTON DETAILS
            trailing: IconButton(
              onPressed: ontap,
              icon: const Icon(Icons.bookmarks),
            ),
          ),
          const SizedBox(height: 10),
          // POSTS TITLE
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // BUTTONS
          Row(
            children: [
              // FAVORITE BUTTON
              Observer(
                builder: (_) => IconButton(
                  onPressed: () {
                    exchange.exchange();
                  },
                  icon: Icon(
                    exchange.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: exchange.isFavorite
                        ? const Color.fromARGB(255, 121, 15, 252)
                        : Colors.white,
                  ),
                ),
              ),
              // MESSENGER BUTTON
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.messenger_outline_sharp,
                ),
              ),
              // SEND BUTTON
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
