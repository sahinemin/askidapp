import 'package:flutter/material.dart';

import '../../../../core/constants/authentication_padding.dart';

class AuthenticationButton extends StatelessWidget with AuthenticationPadding {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  AuthenticationButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: paddingValue,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color)),
              onPressed: onPressed,
              child: Text(text),
            ),
          ),
        ),
      ],
    );
  }
}
