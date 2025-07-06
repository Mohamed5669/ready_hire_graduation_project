import 'package:flutter/material.dart';

class JobTypeProvider with ChangeNotifier {
  bool _isFindJobSelected = true;

  bool get isFindJobSelected => _isFindJobSelected;

  void selectFindJob() {
    _isFindJobSelected = true;
    notifyListeners();
  }

  void selectFindEmployee() {
    _isFindJobSelected = false;
    notifyListeners();
  }
}
