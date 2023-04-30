import 'package:flutter/material.dart';

import '../../../../core/constants/authentication_padding.dart';

class AuthenticationFormField extends StatelessWidget
    with AuthenticationPadding {
  final String labelText;
  final bool obscureText;
  AuthenticationFormField({
    Key? key,
    required this.labelText,
    required this.obscureText,
  }) : super(key: key);

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
                Theme.of(context).inputDecorationTheme.enabledBorder),
      ),
    );
  }
}
