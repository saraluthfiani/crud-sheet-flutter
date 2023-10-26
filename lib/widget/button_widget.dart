import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
          shape: StadiumBorder(),
          backgroundColor: Color.fromARGB(135, 139, 75, 148),
        ),
        onPressed: onClicked,
        child: FittedBox(
          child:
              Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      );
}
