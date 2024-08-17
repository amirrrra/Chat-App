import 'package:chat_app/cubits/chat_cubit/chat_state.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messageReference =
      FirebaseFirestore.instance.collection(kMessageCollection);

  void sendMessages({required String message, required String email}) {
    messageReference.add({
      kMessage: message,
      kTime: DateTime.now(),
      kEmail: email,
    });
  }

  List<MessageModel> messagesList = [];
  void getMessages() {
    messageReference.orderBy(kTime, descending: true).snapshots().listen(
      (event) {
        messagesList.clear();
        for (var doc in event.docs) {
          messagesList.add(
            MessageModel.fromJson(doc),
          );
        }
        emit(ChatSuccessState(messages: messagesList));
      },
    );
  }
}
