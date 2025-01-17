import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/random_joke.dart';

class RandomJokeScreen extends StatelessWidget {
  final ApiService jokeService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Joke')),
      body: FutureBuilder(
        future: jokeService.getRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final joke = snapshot.data!;
            return RandomJokeDisplay(
              setup: joke.setup,
              punchline: joke.punchline,
            );
          }
        },
      ),
    );
  }
}
