import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/cubits/chat_cubit/chat_state.dart';
import 'package:chat_app/widgets/chat_bubble_reciever_widget.dart';
import 'package:chat_app/widgets/chat_bubble_sender_widget.dart';
import 'package:chat_app/widgets/cubit_widgets/chat_text_field_widget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBubbleListWidget extends StatelessWidget {
  final String email;

  const ChatBubbleListWidget({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        var messagesList = BlocProvider.of<ChatCubit>(context).messagesList;

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          reverse: true,
          controller: ChatTextFieldWidgetCubit.scrollController,
          itemCount: messagesList.length,
          itemBuilder: (BuildContext context, int index) {
            return messagesList[index].email == email
                ? ChatBubbleSenderWidget(
                    obj: messagesList[index],
                  )
                : ChatBubbleRecieverWidget(
                    obj: messagesList[index],
                  );
          },
        );
      },
    );
  }
}
