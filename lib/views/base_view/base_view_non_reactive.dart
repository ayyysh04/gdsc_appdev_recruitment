import 'package:flutter/material.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/view_models/base_view_model/base_model.dart';
import 'package:provider/provider.dart';

class BaseViewNonReactive<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Widget? staticChild;
  final bool disposeViewModel;
  final Function(T)? onModelReady;

  const BaseViewNonReactive(
      {Key? key,
      required this.builder,
      this.onModelReady,
      this.staticChild,
      this.disposeViewModel = true})
      : super(key: key);

  @override
  _BaseViewNonReactiveState<T> createState() => _BaseViewNonReactiveState<T>();
}

class _BaseViewNonReactiveState<T extends BaseModel>
    extends State<BaseViewNonReactive<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.disposeViewModel) {
      return ChangeNotifierProvider<T>.value(
        value: model,
        child: widget.builder(context, model, widget.staticChild),
      );
    }
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: widget.builder(context, model, widget.staticChild),
    );
  }
}
