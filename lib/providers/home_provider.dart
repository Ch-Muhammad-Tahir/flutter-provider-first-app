import 'package:flutter/widgets.dart';
import 'package:provider_example/models/product.dart';

class HomeProvider extends ChangeNotifier {
  var favoriteList = [];

  void addToFavorite(Product product) {
    if (!favoriteList.contains(product)) {
      favoriteList.add(product);
    } else {
      favoriteList.remove(product);
    }
    notifyListeners();
  }
}
