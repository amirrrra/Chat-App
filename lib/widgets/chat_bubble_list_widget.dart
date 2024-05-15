import 'package:flutter/material.dart';

class ChatBubbleListWidget extends StatelessWidget {
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemcount;
  const ChatBubbleListWidget({
    super.key,
    required this.itemBuilder,
    required this.itemcount,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemcount,
      itemBuilder: itemBuilder,
    );
  }
}
