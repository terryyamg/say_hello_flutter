import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'widgets/custom_tab_bar.dart';

import '../viewmodels/layout_page_model.dart';
import 'base_view.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BaseView<LayoutPageViewModel>(
      onModelReady: (LayoutPageViewModel model) async {
        model.loadData();
      },
      model: LayoutPageViewModel(api: Provider.of(context)),
      builder:
          (BuildContext context, LayoutPageViewModel model, Widget? child) =>
          Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            appBar: AppBar(
              title: const Text('Layout Page'),
            ),
            body: Container(
                padding: const EdgeInsets.all(8.0),
                child:Stack(
                    children: const [
                      CustomTabBar(
                        tabs: [
                          Tab(text: 'Tab1'),
                          Tab(text: 'Tab2'),
                          Tab(text: 'Tab3'),
                        ],
                      ),
                    ],
                ),
            ),
          ),
    );
  }

}