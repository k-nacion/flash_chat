import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/models/user.dart' as user;

class FirebaseAuthHelper {
  static Future<void> signIn({
    required FirebaseAuth instance,
    required String email,
    required String password,
  }) async {
    await instance.signInWithEmailAndPassword(email: email, password: password);
  }
}

class FirestoreHelper {
  static const _messageCollectionPath = '/messages';
  static const _userCollectionPath = '/users';

  static final _firestoreInstance = FirebaseFirestore.instance;

  static Future<void> storeMessage({
    required Message message,
  }) async {
    CollectionReference reference = _firestoreInstance.collection(_messageCollectionPath);
    await reference.add(message.toMap());
  }

  static Future<void> storeUser({
    required user.User user,
  }) async {
    final reference = _firestoreInstance.collection(_userCollectionPath);
    await reference.add(user.toMap());
  }

  static Future<void> retrieveMessages() async {
    final collectionSnapshot = await _firestoreInstance.collection(_messageCollectionPath).get();
    for (final document in collectionSnapshot.docs) {
      print(document.data().toString());
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> retrieveStreamMessages() {
    return _firestoreInstance.collection(_messageCollectionPath).snapshots();
  }
}
