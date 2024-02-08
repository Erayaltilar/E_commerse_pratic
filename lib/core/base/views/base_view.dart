import 'package:e_commerse_pratik/core/base/viewmodels/base_view_model.dart';
import 'package:e_commerse_pratik/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final T Function(BuildContext)? vmBuilder;
  final Widget Function(BuildContext, T)? builder;
  final Widget Function(BuildContext, T)? loadingBuilder;

  const BaseView(
      {Key? key,
      required this.vmBuilder,
      required this.builder,
      this.loadingBuilder})
      : assert(vmBuilder != null, builder != null),
        super(key: key);

  @override
  BaseViewState createState() => BaseViewState<T>();
}

class BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.vmBuilder!(context),
      child: Consumer<T>(
        builder: _buildScreenContent,
      ),
    );
  }

  Widget _buildScreenContent(
          BuildContext context, T viewModel, Widget? child) =>
      !viewModel.isInitialized
          ? widget.loadingBuilder != null
              ? widget.loadingBuilder!(context, viewModel)
              : const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
          : Stack(
              children: [
                widget.builder!(context, viewModel),
                Visibility(
                  visible: viewModel.isLoading,
                  child: Container(
                    height: context.height,
                    width: context.width,
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                )
              ],
            );
}
