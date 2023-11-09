class User {
  final String createdAt;
  final String updatedAt;
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String type;
  final Client? client; // Le client est désormais facultatif.

  User({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.type,
    this.client, // Le client est facultatif.
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      email: json['email'],
      type: json['type'],
      client: json.containsKey('client') ? Client.fromJson(json['client']) : null,
    );
  }
}

class Client {
  final String id;
  final String birthDate;
  final int salary;
  final String adresse;

  Client({
    required this.id,
    required this.birthDate,
    required this.salary,
    required this.adresse,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      birthDate: json['birthDate'],
      salary: json['salary'],
      adresse: json['adresse'],
    );
  }
}
