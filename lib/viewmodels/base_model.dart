import 'package:flutter/material.dart';
import '../api/api.dart';
import '../view_state.dart';


class BaseModel extends ChangeNotifier {

  BaseModel({required this.api});
  Api api;
  bool disposed = false;

  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}
