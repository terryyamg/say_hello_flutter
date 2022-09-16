import 'dart:async';

import '../api/api.dart';
import 'base_model.dart';

class ViewPageViewModel extends BaseModel {

  ViewPageViewModel({required Api api}) : super(api: api);

  Future<void> loadData() async {
  }
}
