import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:provider/provider.dart';

import '../view-models/alert_page_model.dart';
import 'base_view.dart';
import 'widgets/custom_gradient_elevated_button.dart';
import 'widgets/custom_picker_dialog.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AlertPageViewModel>(
        onModelReady: (AlertPageViewModel model) async {
          model.loadData();
        },
        model: AlertPageViewModel(api: Provider.of(context)),
        builder:
            (BuildContext context, AlertPageViewModel model, Widget? child) =>
                Scaffold(
                  backgroundColor: const Color(0xFFF5F5F5),
                  appBar: AppBar(
                    title: const Text('Alert Page'),
                  ),
                  body: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomGradientElevatedButton(
                      width: 128.0,
                      height: 44.0,
                      borderRadius: BorderRadius.circular(4),
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(0, 198, 129, 1),
                        Color.fromRGBO(1, 178, 103, 1)
                      ]),
                      onPressed: () {
                        final Map<String, String> listItem = {
                          '第一個': '1',
                          '第二個': '2',
                          '第三個': '3',
                        };
                        CustomPickerDialog(
                                context: context,
                                listItem: listItem,
                                onConfirm: (Picker picker, List value) {})
                            .showPicker();
                      },
                      child: const Text('顯示Dialog'),
                    ),
                  ),
                ));
  }
}
