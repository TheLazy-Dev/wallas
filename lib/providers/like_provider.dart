import 'package:flutter/material.dart';

class LikeProvider extends ChangeNotifier {
  bool isLiked = false;

  void clickLike() {
    isLiked = true;
    notifyListeners();
  }
}
