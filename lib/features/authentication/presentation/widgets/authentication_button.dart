import 'package:askidapp/core/constants/authentication_padding.dart';
import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget with AuthenticationPadding {
  AuthenticationButton({
    required this.text,
    required this.onPressed,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: paddingValue,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(text),
            ),
          ),
        ),
      ],
    );
  }
}
