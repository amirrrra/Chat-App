import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class AuthenticationTextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final void Function(String)? onChanged;

  const AuthenticationTextFieldWidget({
    super.key,
    required this.hintText,
    this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    );
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: kSecondryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kGrey,
        ),
        // Don't put textfield into sizedbox since validation change the height
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder.copyWith(
          borderSide: const BorderSide(
            color: kSecondryColor,
          ),
        ),
      ),
      onTapOutside: (pointer) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
