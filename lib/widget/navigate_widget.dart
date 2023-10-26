import 'package:flutter/material.dart';
import 'package:flutter_application/widget/form_widget.dart';

class NavigateWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClickedPrevious;
  final VoidCallback onClickedNext;

  const NavigateWidget({
    Key? key,
    required this.text,
    required this.onClickedPrevious,
    required this.onClickedNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 45,
            icon: Icon(Icons.navigate_before),
            onPressed: onClickedPrevious,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 22),
          ),
          IconButton(
            iconSize: 48,
            icon: Icon(Icons.navigate_next),
            onPressed: onClickedNext,
          )
        ],
      );
}
