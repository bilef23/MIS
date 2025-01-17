import 'package:flutter/material.dart';
import '../models/joke_model.dart';

class FavoritesProvider with ChangeNotifier {
  List<Joke> _favorites = [];

  List<Joke> get favorites => _favorites;

  bool isFavorite(Joke joke) {
    return _favorites.any((item) => item.id == joke.id);
  }

  void addFavorite(Joke joke) {
    _favorites.add(joke);
    notifyListeners(); // This will notify all widgets listening to this provider
  }

  void removeFavorite(Joke joke) {
    _favorites.removeWhere((item) => item.id == joke.id);
    notifyListeners(); // This will notify all widgets listening to this provider
  }
}
