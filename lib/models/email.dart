class Email {
  String _username;
  String _password;

  Email(
    this._username,
    this._password,
  );

  String get username => _username;
  String get password => _password;

  @override
  String toString() {
    return 'Email{_username: $_username}';
  }
}
