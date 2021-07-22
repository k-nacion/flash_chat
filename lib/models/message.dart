class Message {
  String message;
  String author;
  DateTime dateTime;

  Message({required this.message, required this.author, DateTime? dateTime})
      : this.dateTime = dateTime ?? DateTime.now();

  @override
  String toString() {
    return 'Message{message: $message, sender: $author}';
  }

  Map<String, dynamic> toMap() => {
        MessageFields.message.toString(): message,
        MessageFields.author.toString(): author,
        MessageFields.datetime.toString(): dateTime,
      };
}

enum MessageFields { message, author, datetime }
