import 'package:flutter/material.dart';
import 'package:medcollapp/widgets/ProgressWidget.dart';

class ProgressContainerView extends StatelessWidget {
  final Widget? child;
  final Widget? progressWidget;
  final bool? isProgressRunning;
  final String progressText;
  final double progressWidgetOpacity;

  ProgressContainerView(
      {@required this.child,
      @required this.isProgressRunning,
      this.progressText = "Please Wait",
      this.progressWidgetOpacity = 0.6,
      this.progressWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child ?? Container(),
        Visibility(
            visible: isProgressRunning??false,
            child: Container(
                color: Colors.black.withOpacity(progressWidgetOpacity),
                child: progressWidget ?? ProgressWidget(progressText))),
      ],
    );
  }
}
