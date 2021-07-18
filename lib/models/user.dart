class User {
  String firstName;
  String lastName;
  String email;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, email: $email}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ email.hashCode;

  Map<String, dynamic> toMap() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
      };
}
