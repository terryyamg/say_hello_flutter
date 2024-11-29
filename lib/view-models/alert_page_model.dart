import 'dart:async';

import '../api/api.dart';
import 'base_model.dart';

class AlertPageViewModel extends BaseModel {
  AlertPageViewModel({required Api api}) : super(api: api);

  Future<void> loadData() async {}
}
