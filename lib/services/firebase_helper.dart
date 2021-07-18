import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/models/user.dart';

class FirebaseAuthHelper {
  // static signUpWithEmail({FirebaseAuth instance, User user} ) {
  //
  // }

}

class FirestoreHelper {
  static const _messageCollectionPath = '/messages';
  static const _userCollectionPath = '/users';

  static Future<void> storeMessage(
      {required FirebaseFirestore instance, required Message message}) async {
    CollectionReference reference = instance.collection(_messageCollectionPath);
    await reference.add(message.toMap());
  }

  static Future<void> storeUser({required FirebaseFirestore instance, required User user}) async {
    final reference = instance.collection(_userCollectionPath);
    await reference.add(user.toMap());
  }

  static Future<void> retrieveMessages(FirebaseFirestore instance) async {
    final messageSnapshots = await instance.collection(_messageCollectionPath).get();
    for (final querySnapshot in messageSnapshots.docs) {
      print(querySnapshot.data().toString());
    }
  }
}
