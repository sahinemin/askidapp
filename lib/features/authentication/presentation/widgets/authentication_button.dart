import 'package:askidapp/core/constants/authentication_padding.dart';
import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget with AuthenticationPadding {

  AuthenticationButton({
    required this.text, required this.color, required this.onPressed, super.key,
  });
  final Color color;
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
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color),),
              onPressed: onPressed,
              child: Text(text),
            ),
          ),
        ),
      ],
    );
  }
}
