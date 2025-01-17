import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Favorite Jokes")),
      body: favoritesProvider.favorites.isEmpty
          ? Center(child: Text("No favorite jokes yet!"))
          : ListView.builder(
        itemCount: favoritesProvider.favorites.length,
        itemBuilder: (context, index) {
          final joke = favoritesProvider.favorites[index];
          return Card(
            child: ListTile(
              title: Text(joke.setup),
              subtitle: Text(joke.punchline),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  favoritesProvider.removeFavorite(joke);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
