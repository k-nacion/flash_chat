import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  static const messageField = 'message';
  static const authorField = 'author';
  static const dateTimeField = 'dateTime';

  String message;
  String author;
  DateTime dateTime;

  Message({
    required this.message,
    required this.author,
    DateTime? dateTime,
  }) : this.dateTime = dateTime ?? DateTime.now();

  Message.fromFirestore(Map<String, dynamic> json)
      : this(
            message: json[messageField] as String,
            author: json[authorField] as String,
            dateTime: (json[dateTimeField] as Timestamp).toDate());

  @override
  String toString() {
    return 'Message{message: $message, sender: $author}';
  }

  Map<String, dynamic> toMap() => {
        messageField: message,
        authorField: author,
        dateTimeField: dateTime,
      };
}
