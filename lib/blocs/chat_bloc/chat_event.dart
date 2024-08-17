part of 'chat_bloc.dart';

sealed class ChatEvent {}

class SendEvent extends ChatEvent {
  final String message;
  final String email;

  SendEvent({required this.message, required this.email});
}

class GetEvent extends ChatEvent {}
