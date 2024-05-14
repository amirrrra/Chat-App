import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class AuthenticationButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const AuthenticationButtonWidget({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: kSecondryColor,
          fixedSize: const Size(double.infinity, 48),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          )),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: kWhite,
        ),
      ),
    );
  }
}
