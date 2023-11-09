
class Reparation {
  final String invoice;
  final String description;
  final double amount;
  final String vehiculeId;
  final String userId;

  Reparation({
    required this.invoice,
    required this.description,
    required this.amount,
    required this.vehiculeId,
    required this.userId,
  });

  factory Reparation.fromJson(Map<String, dynamic> json) {
    return Reparation(
      invoice: json['invoice'],
      description: json['description'],
      amount: (json['amount'] as num).toDouble(),
      vehiculeId: json['vehiculeId'] != null ? json['vehiculeId'] : '',
      userId: json['userId'] != null ? json['userId'] : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'invoice': invoice,
      'description': description,
      'amount': amount,
      'vehiculeId': vehiculeId,
      'userId': userId,
    };
  }
}
