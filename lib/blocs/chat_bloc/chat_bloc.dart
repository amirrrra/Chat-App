import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatBlocState> {
  List<MessageModel> messagesList = [];
  ChatBloc() : super(ChatBlocStateInitial()) {
    on<ChatEvent>((event, emit) {
      CollectionReference messageReference =
          FirebaseFirestore.instance.collection(kMessageCollection);

      if (event is SendEvent) {
        messageReference.add({
          kMessage: event.message,
          kTime: DateTime.now(),
          kEmail: event.email,
        });
      }
      if (event is GetEvent) {
        messageReference.orderBy(kTime, descending: true).snapshots().listen(
          (query) {
            messagesList.clear();
            for (var doc in query.docs) {
              messagesList.add(
                MessageModel.fromJson(doc),
              );
            }
            emit(ChatSuccessState(messages: messagesList));
          },
        );
      }
    });
  }
}
