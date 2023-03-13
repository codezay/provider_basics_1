import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics_1/pages/favorites_page.dart';
import 'package:provider_basics_1/provider/favorite_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final words = nouns.take(50).toList();
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Words'),
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
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final route = MaterialPageRoute(
              builder: (context) => const FavoritesPage(),
            );
            Navigator.push(context, route);
          },
          label: const Text('Favorites')),
    );
  }
}
