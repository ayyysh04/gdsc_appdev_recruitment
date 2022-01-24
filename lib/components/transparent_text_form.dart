import 'package:flutter/material.dart';
import 'package:gdsc_appdev/constants/constants.dart';

class TransparentTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String text;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  TransparentTextForm({
    Key? key,
    this.controller,
    required this.text,
    this.prefixIcon,
    this.backgroundColor,
    this.onChanged,
    this.focusNode,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Theme.of(context).inputDecorationTheme.helperStyle!.fontStyle);
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      focusNode: focusNode,
      style: TextStyle(color: kPrimaryColor),
      onChanged: onChanged,
      cursorColor: kPrimaryColor,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: prefixIcon == null
              ? null
              : Icon(
                  prefixIcon,
                  color: Colors.black54,
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.all(kDefaultPadding * 0.80),
          hintStyle: TextStyle(color: Colors.black54),
          filled: true,
          fillColor: backgroundColor ??
              Theme.of(context).inputDecorationTheme.fillColor,
          hintText: text),
    );
  }
}
