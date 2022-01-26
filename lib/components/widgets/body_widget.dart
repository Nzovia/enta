import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  //checkbox bool
  bool valueChecked = false;

  var text;
  @override
  Widget build(BuildContext context) => Container(
    child:Column(
      children: [
        const Text("Read Terms and Conditions",
          style: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 18,
          ),
        ),
        Row(children: <Widget>[
          const SizedBox(
            width: 10.0,
          ),
          const SizedBox(height: 14),
          Checkbox(
              value: valueChecked,
              checkColor: Colors.greenAccent,
              shape: const CircleBorder(),
              onChanged: (bool? value) {
                setState(() {
                  valueChecked = value!;
                });
              }),
          const Text(
            'Accept the Terms and Conditions',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
          ),
        ]),

      ],
    ),

  );
}
