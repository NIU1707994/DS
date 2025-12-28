import 'package:exercise_flutter_acs/tree.dart';

// Aquesta classe fa de memòria per saber quina area està a preferits i quina no.
class FavoritesStorage {
  static final List<Area> _favorites = [];

  static List<Area> get favorites => _favorites;

  // Comprova si una id està a la llista
  static bool isFavorite(String id) {
    return _favorites.any((element) => element.id == id);
  }

  static void toggleFavorite(Area area) {
    if (isFavorite(area.id)) {
      _favorites.removeWhere((element) => element.id == area.id);
      area.favourite = false;
    } else {
      area.favourite = true;
      _favorites.add(area);
    }
  }
}