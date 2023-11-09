
class Vehicule {
  final String id;
  final String registration;
  final String power;
  final String color;
  final String brand;
  final DateTime startedDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  Vehicule({
    required this.id,
    required this.registration,
    required this.power,
    required this.color,
    required this.brand,
    required this.startedDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Vehicule.fromJson(Map<String, dynamic> json) {
    return Vehicule(
      id: json['id'],
      registration: json['registration'],
      power: json['power'],
      color: json['color'],
      brand: json['brand'],
      startedDate: DateTime.parse(json['startedDate']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'registration': registration,
      'power': power,
      'color': color,
      'brand': brand,
      'startedDate': startedDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
