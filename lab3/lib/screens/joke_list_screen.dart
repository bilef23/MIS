import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Add this import
import '../models/joke_model.dart';
import '../providers/favorites_provider.dart';  // Import the FavoritesProvider
import '../screens/favorites_screen.dart';

class JokeList extends StatelessWidget {
  final List<Joke> jokes;

  const JokeList({Key? key, required this.jokes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the FavoritesProvider using Provider.of
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Navigate to FavoritesScreen with the list of favorite jokes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
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
                onPressed: () => _toggleFavorite(favoritesProvider, joke),
              ),
            ),
          );
        },
      ),
    );
  }

  // Toggle favorite status
  void _toggleFavorite(FavoritesProvider favoritesProvider, Joke joke) {
    print("Method _toggleFavorite called");
    if (favoritesProvider.isFavorite(joke)) {
      print("Toggle: $joke");
      favoritesProvider.removeFavorite(joke);
    } else {
      print("Toggle: $joke");
      favoritesProvider.addFavorite(joke);
    }
  }
}
