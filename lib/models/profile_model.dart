class ProfileData {
  String role;
  String id_;
  String firstname;
  String lastname;
  String email;
  String phone;
  String address;
  String stateOfResidence;
  int v;

  ProfileData({
    this.role,
    this.id_,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.address,
    this.stateOfResidence,
    this.v,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      role: json['role'],
      id_: json['_id'],
      firstname: json['firstName'],
      lastname: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      stateOfResidence: json['stateOfResidence'],
      v: json['__v'],
    );
  }
}
