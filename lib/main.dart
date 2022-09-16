import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_setup.dart';
import 'routers.dart';
import 'utils/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter MVVM',
        theme: ThemeData(
          primarySwatch: CustomColors.colorPrimary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RoutePaths.landingPage,
        onGenerateRoute: Routers.generateRoute,
      ),
    );
  }
}