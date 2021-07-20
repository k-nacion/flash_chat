class Message {
  String text;
  String sender;

  Message({required this.text, required this.sender});

  @override
  String toString() {
    return 'Message{message: $text, sender: $sender}';
  }

  Map<String, dynamic> toMap() => {'message': text, 'sender': sender};
}
