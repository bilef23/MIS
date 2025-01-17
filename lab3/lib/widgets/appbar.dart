import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onRandomJokePressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onRandomJokePressed,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.casino),
          onPressed: onRandomJokePressed,
          tooltip: 'Random Joke',
        ),
      ],
    );
  }
}
