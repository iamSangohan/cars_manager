class User {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final String adresse;
  final String type;

  User(
    {
      this.firstName = '',
      this.lastName = '',
      this.phone = '',
      this.email = '',
      this.password = '',
      this.adresse = '',
      this.type = '',
    }
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      adresse: json['adresse'],
      type: json['type'],
    );
  }
}
