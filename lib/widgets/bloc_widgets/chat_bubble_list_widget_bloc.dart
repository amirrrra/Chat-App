import 'package:chat_app/blocs/chat_bloc/chat_bloc.dart';
import 'package:chat_app/widgets/chat_bubble_reciever_widget.dart';
import 'package:chat_app/widgets/chat_bubble_sender_widget.dart';
import 'package:chat_app/widgets/bloc_widgets/chat_text_field_widget_bloc.dart';
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
    return BlocBuilder<ChatBloc, ChatBlocState>(
      builder: (context, state) {
        var messagesList = BlocProvider.of<ChatBloc>(context).messagesList;

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          reverse: true,
          controller: ChatTextFieldWidgetBloc.scrollController,
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
