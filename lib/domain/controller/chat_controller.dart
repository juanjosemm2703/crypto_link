import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ChatController extends GetxController {
  final CollectionReference chatCollection =
      FirebaseFirestore.instance.collection("ChatRoom");

  createChatRoom(String chatRoomId, chatRoomMap) async {
    await chatCollection.doc(chatRoomId).set(chatRoomMap).catchError((e) {
      print(e.toString());
    });
  }

  createChatRoomAndStartConversation(String username1, String username2) {
    String chatRoomId = getChatRoomId(username1, username2);
    List<String> users = [username1, username2];
    Map<String, dynamic> chatRoomMap = {
      "users": users,
      "chatroomid": chatRoomId,
    };
    createChatRoom(chatRoomId, chatRoomMap);
  }

  getChatRooms(String userName) {
    return FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userName)
        .snapshots();
  }

  getChatRoomId(String a, String b) {
    int valor1 = 0;
    int valor2 = 0;
    for (int i = 0; i < a.length; i++) {
      valor1 = valor1 + a.codeUnitAt(i);
    }
    for (int i = 0; i < b.length; i++) {
      valor2 = valor2 + b.codeUnitAt(i);
    }
    if (valor1 < valor2) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  addConversationMessage(String chatRoomId, messageMap) async {
    await chatCollection
        .doc(chatRoomId)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  sendMessage(String chatRoomId, message, username, date) async {
    Map<String, String> messageMap = {
      "message": message,
      "sendBy": username,
      "date": date,
    };
    await addConversationMessage(chatRoomId, messageMap);
  }
}
