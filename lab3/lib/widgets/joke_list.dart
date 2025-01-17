import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Ensure this import
import '../models/joke_model.dart';
import '../providers/favorites_provider.dart';
import '../screens/favorites_screen.dart'; // Import the provider

class JokeList extends StatelessWidget {
  final List<Joke> jokes;

  const JokeList({Key? key, required this.jokes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Consumer to listen for updates in FavoritesProvider
    return Scaffold(
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          return ListView.builder(
            itemCount: jokes.length,
            itemBuilder: (context, index) {
              final joke = jokes[index];
              final isFavorite = favoritesProvider.isFavorite(joke); // Check if joke is a favorite

              return Card(
                child: ListTile(
                  title: Text(joke.setup),
                  subtitle: Text(joke.punchline),
                  trailing: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      // Call the toggle method when button is pressed
                      if (isFavorite) {
                        favoritesProvider.removeFavorite(joke);
                      } else {
                        favoritesProvider.addFavorite(joke);
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
