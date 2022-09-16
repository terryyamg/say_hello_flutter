// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../models/list_item.dart';
import '../routers.dart';
import '../utils/custom_text_style.dart';
import '../viewmodels/landing_page_model.dart';
import 'base_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LandingPageViewModel>(
        onModelReady: (LandingPageViewModel model) async {
          model.loadData();
        },
        model: LandingPageViewModel(
          api: Provider.of(context),
        ),
        builder:
            (BuildContext context, LandingPageViewModel model, Widget? child) =>
                Scaffold(
                  backgroundColor: const Color(0xFFF5F5F5),
                  appBar: AppBar(
                    title: const Text('Landing Page'),
                  ),
                  body: _buildBody(context, model),
                ));
  }

  Widget _buildBody(BuildContext context, LandingPageViewModel model) {
    final List<ListItem> list = [
      ListItem(const Icon(Icons.view_agenda_outlined, color: Colors.white),
          RoutePaths.viewPage, Colors.blue[700]),
      ListItem(const Icon(Icons.layers_outlined, color: Colors.yellow),
          RoutePaths.layoutPage, Colors.blue[600]),
      ListItem(const Icon(Icons.add_alert, color: Colors.red), RoutePaths.alertPage,
          Colors.blue[500])
    ];
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: _getItem(list[index]),
            onTap: () {
              print("[DEBUG]:${list[index].title}");
              switch (list[index].title) {
                case RoutePaths.viewPage:
                  Navigator.of(context).pushNamed(RoutePaths.viewPage);
                  break;
                case RoutePaths.layoutPage:
                  Navigator.of(context).pushNamed(RoutePaths.layoutPage);
                  break;
                case RoutePaths.alertPage:
                  Navigator.of(context).pushNamed(RoutePaths.alertPage);
                  break;
              }
            },
          );
        },
        itemCount: list.length);
  }

  Widget _getItem(ListItem item) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 50,
      color: item.color,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 32.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: item.icon,
            ),
          ),
          Align(
            child: Text(
              item.title,
              style: CustomTextStyle.text24BoldWhite,
            ),
          ),
        ],
      ),
    );
  }
}
