import 'dart:async';

import '../api/api.dart';
import 'base_model.dart';

class LayoutPageViewModel extends BaseModel {
  LayoutPageViewModel({required Api api}) : super(api: api);

  Future<void> loadData() async {}
}
