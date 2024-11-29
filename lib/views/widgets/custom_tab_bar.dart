import 'package:flutter/material.dart';

import '../../utils/custom_text_style.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);
  final List<Widget> tabs;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController =
        TabController(length: widget.tabs.length, vsync: this);

    return Container(
      height: 36.0,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Container(
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: TabBar(
          controller: tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: const Color.fromRGBO(1, 178, 103, 1)),
          unselectedLabelColor: Colors.black,
          labelStyle: CustomTextStyle.text14BoldBlack,
          unselectedLabelStyle: CustomTextStyle.text14NormalGrey,
          tabs: widget.tabs,
        ),
      ),
    );
  }
}
