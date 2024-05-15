import 'package:chat_app/utils/constants.dart';

class MessageModel {
  final String message;

  MessageModel({required this.message});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      message: jsonData[kMessage],
    );
  }
}