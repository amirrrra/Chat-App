import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/app_bar_widget.dart';
import 'package:chat_app/widgets/cubit_widgets/chat_bubble_list_widget_cubit.dart';
import 'package:chat_app/widgets/cubit_widgets/chat_text_field_widget_cubit.dart';
import 'package:flutter/material.dart';

class ChatViewCubit extends StatelessWidget {
  const ChatViewCubit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: kChatColor,
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          Expanded(
            child: ChatBubbleListWidget(
              email: email,
            ),
          ),
          ChatTextFieldWidgetCubit(
            email: email,
          ),
        ],
      ),
    );
  }
}
