import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  //button properties
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({Key? key, required this.text, required this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onClicked,
        color: Colors.greenAccent,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      );
}
