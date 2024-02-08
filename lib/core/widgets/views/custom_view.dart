import 'package:e_commerse_pratik/core/consts/size/size.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomView extends StatefulWidget {
  const CustomView({
    super.key,
    required this.child,
    this.padding,
    this.backButton,
    this.title,
    this.showTitle,
    this.suffix,
  });
  final Widget child;
  final Widget? backButton;
  final EdgeInsets? padding;
  final String? title;
  final bool? showTitle;
  final Widget? suffix;

  @override
  State<CustomView> createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomView> {
  late EdgeInsets padding;
  late Widget backButton;
  late Widget child;
  late String? title;
  late bool showTitle;
  late Widget? suffix;

  @override
  void didUpdateWidget(covariant CustomView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showTitle != widget.showTitle) {
      showTitle = widget.showTitle ?? false;
    }
    if (oldWidget.title != widget.title) {
      title = widget.title;
    }
    if (oldWidget.backButton != widget.backButton) {
      backButton = widget.backButton ?? Container();
    }
    if (oldWidget.padding != widget.padding) {
      padding = widget.padding ?? ProjectSizes.screenEdgeInsets;
    }
    if (oldWidget.child != widget.child) {
      child = widget.child;
    }
    if (oldWidget.suffix != widget.suffix) {
      suffix = widget.suffix;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    padding = widget.padding ?? ProjectSizes.screenEdgeInsets;
    backButton = widget.backButton ?? Container();
    child = widget.child;
    title = widget.title;
    suffix = widget.suffix;
    showTitle = widget.showTitle ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 2.h, right: 2.h),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 12.h,
              width: 100.w,
              padding: EdgeInsets.only(right: 5.w, left: 5.w, bottom: 5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  backButton,
                  if (showTitle) ...{
                    SizedBox(
                      width: 5.w,
                    ),
                  },
                  const Spacer(),
                  if (suffix != null) ...{
                    suffix!,
                  }
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
