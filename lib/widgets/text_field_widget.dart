import 'package:chat_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  const TextFieldWidget({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    );
    return SizedBox(
      height: 56,
      child: TextField(
        selectionControls:CupertinoTextSelectionControls(),
        cursorColor: black,
        decoration: InputDecoration(
          hintText: hintText,
          border: outlineInputBorder,
          focusedBorder: outlineInputBorder.copyWith(
            borderSide: const BorderSide(
              color: black,
            ),
          ),
        ),
        onTapOutside: (pointer) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
