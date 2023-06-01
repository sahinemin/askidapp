// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthenticationFormField extends TextFormField {
  AuthenticationFormField({
    required this.labelText,
    required this.textController,
    this.isObscureText = false,
    this.action = TextInputAction.next,
    this.denySpace = true,
    this.inputType = TextInputType.text,
    super.key,
  }) : super(
          keyboardType: inputType,
          obscureText: isObscureText,
          decoration: InputDecoration(
            labelText: labelText,
          ),
          controller: textController,
          textInputAction: action,
          inputFormatters: [
            if (denySpace)
              FilteringTextInputFormatter.deny(
                RegExp(r'\s'),
              ),
          ],
        );
  final String labelText;
  final bool isObscureText;
  final TextEditingController textController;
  final TextInputAction action;
  final bool denySpace;
  final TextInputType inputType;
}
