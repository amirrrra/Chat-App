import 'package:chat_app/models/message_model.dart';

class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatSuccessState extends ChatState {
  final List<MessageModel> messages;

  ChatSuccessState({required this.messages});
}
