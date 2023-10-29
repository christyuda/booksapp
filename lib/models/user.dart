class RegistrationData {
  final String name;
  final String email;
  final String address;
  final String password;

  RegistrationData(
      {required this.name,
      required this.email,
      required this.address,
      required this.password});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'password': password,
    };
  }
}
