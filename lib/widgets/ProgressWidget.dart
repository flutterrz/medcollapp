import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final String progressText;

  const ProgressWidget(this.progressText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const CircularProgressIndicator.adaptive(),
          const SizedBox(height: 8),
          Text(
            progressText,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
