import 'package:chat_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.onChanged,
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
      selectionControls: CupertinoTextSelectionControls(),
      cursorColor: black,
      decoration: InputDecoration(
        hintText: hintText,
        // Don't put textfield into sizedbox since validation change the height
        contentPadding: const EdgeInsets.all(10),
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
    );
  }
}
