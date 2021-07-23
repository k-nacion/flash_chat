import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/models/user.dart' as user;

class FirestoreHelper {
  static const _messageCollectionPath = '/messages';
  static const _userCollectionPath = '/users';

  static final _firestoreInstance = FirebaseFirestore.instance;

  static Future<void> storeMessage({
    required Message message,
  }) async {
    CollectionReference reference =
        _firestoreInstance.collection(_messageCollectionPath).withConverter<Message>(
              fromFirestore: (snapshot, _) => message,
              toFirestore: (message, _) => message.toMap(),
            );

    await reference.add(message);
  }

  static Future<void> storeUser({
    required user.User newUser,
  }) async {
    final reference = _firestoreInstance.collection(_userCollectionPath).withConverter<user.User>(
        fromFirestore: (snapshot, _) => newUser, toFirestore: (newUser, _) => newUser.toMap());
    await reference.add(newUser);
  }

  static Future<void> retrieveMessages() async {
    final collectionSnapshot = await _firestoreInstance.collection(_messageCollectionPath).get();
    for (final document in collectionSnapshot.docs) {
      print(document.data().toString());
    }
  }

  static Stream<QuerySnapshot<Message>> retrieveStreamMessages() {
    return _firestoreInstance
        .collection(_messageCollectionPath)
        .withConverter<Message>(
          fromFirestore: (snapshot, _) => Message.fromFirestore(snapshot.data()!),
          toFirestore: (message, _) => message.toMap(),
        )
        .snapshots();
  }

  static Stream<QuerySnapshot<Message>> retrieveStreamMessagesWithConverter(
      {bool descending = false}) {
    return _firestoreInstance
        .collection(_messageCollectionPath)
        .withConverter<Message>(
          fromFirestore: (snapshot, _) => Message.fromFirestore(snapshot.data()!),
          toFirestore: (message, _) => message.toMap(),
        )
        .orderBy(Message.dateTimeField, descending: descending)
        .snapshots();
  }
}
