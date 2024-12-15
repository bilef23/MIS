import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/joke_list.dart';

class JokeTypeScreen extends StatelessWidget {
  final String type;
  final ApiService jokeService = ApiService();

  JokeTypeScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type Jokes')),
      body: FutureBuilder(
        future: jokeService.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return JokeList(jokes: snapshot.data!);
          }
        },
      ),
    );
  }
}
