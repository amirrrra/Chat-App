import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: black,
          fixedSize: const Size(double.infinity, 52),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          )),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: white,
        ),
      ),
    );
  }
}
