import 'package:flutter/material.dart';
import 'package:gdsc_appdev/services/locator.dart';
import 'package:gdsc_appdev/view_models/base_view_model/base_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T model)? onModelReady;
  T? model; //pass the already built chnageNotifier if you dont want to create a new one
  BaseView({required this.builder, this.onModelReady, this.model});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  @override
  void initState() {
    widget.model ??= widget.model = locator<T>();
    print(widget.onModelReady == null);
    if (widget.onModelReady != null) {
      widget.onModelReady!(widget.model!);
    }

    super.initState();
  }

  @override
  void dispose() {
    // widget.model?.dispose(); //disposes the model
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      //if not work use create method
      value: widget.model!,

      child: Consumer<T>(builder: widget.builder),
    );
  }
}
