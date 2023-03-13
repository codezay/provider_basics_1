import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics_1/provider/favorite_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final words = provider.words;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          // return Text(word);
          return ListTile(
            title: Text(word),
            trailing: IconButton(
              onPressed: () {
                debugPrint('Favorite icon pressed on index: $index');
                provider.toggleFavorite(word);
              },
              // icon: Icon(Icons.favorite_outline_rounded),
              icon: provider.isExist(word)
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    );
  }
}
