import 'package:askidapp/core/constants/authentication_padding.dart';
import 'package:flutter/material.dart';

class AuthenticationFormField extends StatelessWidget
    with AuthenticationPadding {
  AuthenticationFormField({
    required this.labelText, required this.obscureText, super.key,
  });
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingValue,
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            labelText: labelText,
            enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
            focusedBorder:
                Theme.of(context).inputDecorationTheme.enabledBorder,),
      ),
    );
  }
}
