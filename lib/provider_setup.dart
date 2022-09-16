import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../api/api.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider(create: (_) => Api()),
];

List<SingleChildWidget> dependentServices = [
  //這裡使用ProxyProvider來定義需要依賴其他Provider的服務
];
