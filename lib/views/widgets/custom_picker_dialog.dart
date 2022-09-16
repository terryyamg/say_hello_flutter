import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';

import '../../utils/custom_text_style.dart';

class CustomPickerDialog {
  const CustomPickerDialog({
    required this.context,
    required this.listItem,
    this.onConfirm,
  });

  final BuildContext context;
  final Map<String, String> listItem;
  final PickerConfirmCallback? onConfirm;

  showPicker() {
    const itemExtent = 42.0;
    const bgColor = Colors.white;
    const txtStyle = CustomTextStyle.text14NormalGrey;
    const selectColor = Color.fromRGBO(137, 172, 255, 0.2);

    Picker(
      height: 296,
      itemExtent: itemExtent,
      backgroundColor: Colors.transparent,
      containerColor: bgColor,
      selectionOverlay: Container(height: itemExtent, color: selectColor),
      headerDecoration: BoxDecoration(color: Colors.white.withOpacity(0.05)),
      textStyle: txtStyle,
      cancelTextStyle: txtStyle,
      confirmTextStyle: CustomTextStyle.text14BoldBlue,
      selectedTextStyle: CustomTextStyle.text14BoldBlue,
      adapter: _getAdapter(listItem),
      confirmText: '確認',
      cancelText: '取消',
      delimiter: _getDelimiter(itemExtent, selectColor),
      title: const Padding(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Text('我是標題', style: txtStyle),
      ),
      onConfirm: onConfirm,
    ).showModal(context, builder: (context, view) {
      return Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: view,
        ),
      );
    }, backgroundColor: Colors.transparent);
  }

  List<PickerDelimiter>? _getDelimiter(double itemExtent, Color? selectColor) {
    final delimiterChildLeft = Align(
      child: Container(
        margin: const EdgeInsets.only(left: 25.0),
        width: 50,
        height: itemExtent,
        decoration: BoxDecoration(
          color: selectColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
      ),
    );
    final delimiterChildRight = Align(
      child: Container(
        margin: const EdgeInsets.only(right: 25.0),
        width: 50,
        height: itemExtent,
        decoration: BoxDecoration(
          color: selectColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
        ),
      ),
    );

    return [
      PickerDelimiter(column: 0, child: delimiterChildLeft),
      PickerDelimiter(child: null),
      PickerDelimiter(column: 2, child: delimiterChildRight),
    ];
  }

  PickerDataAdapter _getAdapter(Map<String, String> listItem) {
    final List<PickerItem<dynamic>> list = [];
    listItem.forEach((key, value) {
      final PickerItem item = PickerItem(
          text: Container(
            alignment: Alignment.center,
            child: Text(key,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
          value: value);
      list.add(item);
    });
    return PickerDataAdapter(data: list);
  }
}
