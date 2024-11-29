import 'dart:async';

import '../api/api.dart';
import '../view_state.dart';
import 'base_model.dart';

class LandingPageViewModel extends BaseModel {
  LandingPageViewModel({required Api api}) : super(api: api);

  Future<void> loadData() async {
    print('[DEBUG]Loading...');
    setState(ViewState.busy);
    await Future.delayed(const Duration(seconds: 2), () {
      print('[DEBUG]Future.delayed');
    });
    setState(ViewState.idle);
    print('[DEBUG]Loading完成');
  }
}
