import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../viewmodels/view_page_model.dart';
import 'base_view.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ViewPageViewModel>(
      onModelReady: (ViewPageViewModel model) async {
        model.loadData();
      },
      model: ViewPageViewModel(api: Provider.of(context)),
      builder:
          (BuildContext context, ViewPageViewModel model, Widget? child) =>
          Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            appBar: AppBar(
              title: const Text('View Page'),
            ),
            body: const Text('View Page'),
          ),
    );
  }
}