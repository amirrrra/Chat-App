part of 'chat_bloc.dart';

sealed class ChatBlocState {}

final class ChatBlocStateInitial extends ChatBlocState {}

class ChatLoadingState extends ChatBlocState {}

class ChatSuccessState extends ChatBlocState {
  final List<MessageModel> messages;

  ChatSuccessState({required this.messages});
}
