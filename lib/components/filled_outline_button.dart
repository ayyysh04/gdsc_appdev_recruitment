import 'package:flutter/material.dart';

import '../constants/constants.dart';

class FillOutlineButton extends StatelessWidget {
  const FillOutlineButton({
    Key? key,
    this.isFilled = true,
    required this.press,
    required this.text,
  }) : super(key: key);

  final bool isFilled;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.black38),
      ),
      elevation: isFilled ? 2 : 0,
      color: isFilled ? Colors.black87 : Colors.white,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
            color: isFilled ? Colors.white : Colors.black38,
            fontSize: 12,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}
