class User {
  String email;
  String firstName;
  String lastName;

  User({this.email, this.firstName, this.lastName});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      email: responseData['email'],
      firstName: responseData['firstName'],
      lastName: responseData['lastName'],
    );
  }
}
