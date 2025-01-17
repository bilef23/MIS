import 'package:flutter/material.dart';
import '../providers/favorites_provider.dart'; // Add Provider import
import '../services/api_service.dart';
import '../widgets/card_grid.dart';
import 'random_joke_screen.dart';
import 'joke_type_screen.dart';
import 'favorites_screen.dart'; // Import the FavoritesScreen
import '../providers/favorites_provider.dart'; // Import the FavoritesProvider

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke Types'),
        actions: [
          Tooltip(
            message: "Get a Random Joke",
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RandomJokeScreen()),
                );
              },
              icon: Icon(Icons.lightbulb),
            ),
          ),
          Tooltip(
            message: "View Favorite Jokes",
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesScreen()),
                );
              },
              icon: Icon(Icons.favorite),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: apiService.getJokeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return CardGrid(
              items: snapshot.data!,
              onItemTap: (type) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => JokeTypeScreen(type: type),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
