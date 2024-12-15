import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/card_grid.dart';
import 'random_joke_screen.dart';
import 'joke_type_screen.dart';

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
            child: IconButton( onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomJokeScreen()),
              );
            }, icon: Icon(Icons.lightbulb),)
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
