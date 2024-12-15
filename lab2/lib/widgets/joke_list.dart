import 'package:flutter/material.dart';
import '../models/joke_model.dart';

class JokeList extends StatelessWidget {
  final List<Joke> jokes;

  const JokeList({Key? key, required this.jokes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(jokes[index].setup),
          subtitle: Text(jokes[index].punchline),
        );
      },
    );
  }
}
