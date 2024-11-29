import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view-models/a_page_model.dart';
import 'base_view.dart';

class APage extends StatelessWidget {
  const APage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<APageViewModel>(
        onModelReady: (APageViewModel model) async {
          model.loadData();
        },
        model: APageViewModel(api: Provider.of(context)),
        builder: (BuildContext context, APageViewModel model, Widget? child) =>
            Scaffold(
              backgroundColor: const Color(0xFFF5F5F5),
              appBar: AppBar(
                title: const Text('A Page'),
              ),
              body: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 200.0,
                        height: 100.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: null,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 200.0,
                        child: AbsorbPointer(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade200,
                            ),
                            onPressed: () {},
                            child: null,
                          ),
                        ),
                      ),
                    ],
                  )),
            ));
  }
}
