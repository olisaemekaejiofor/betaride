class User {
  String email;
  String firstName;
  String lastName;
  String token;

  User({this.email, this.firstName, this.lastName, this.token});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      email: responseData['email'],
      firstName: responseData['firstName'],
      lastName: responseData['lastName'],
      token: responseData['token'],
    );
  }
}
