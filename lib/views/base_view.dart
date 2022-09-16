import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/base_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  const BaseView(
      {Key? key,
      required this.model,
      required this.builder,
      this.child,
      required this.onModelReady})
      : super(key: key);
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  final T model;
  final Widget? child;
  final Function(T) onModelReady;

  @override
  State<BaseView> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null && model != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
      create: (BuildContext context) {
        return model;
      },
    );
  }
}
