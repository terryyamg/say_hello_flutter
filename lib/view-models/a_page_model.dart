import 'dart:async';

import '../api/api.dart';
import 'base_model.dart';

class APageViewModel extends BaseModel {
  APageViewModel({required Api api}) : super(api: api);

  Future<void> loadData() async {}
}
