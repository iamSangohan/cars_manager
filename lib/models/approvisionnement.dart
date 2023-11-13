class Approvisionnement {
  String invoice;
  int quantity;
  int amount;
  String vehiculeId;
  String userId;

  Approvisionnement({
    required this.invoice,
    required this.quantity,
    required this.amount,
    required this.vehiculeId,
    required this.userId,
  });

  factory Approvisionnement.fromJson(Map<String, dynamic> json) {
    return Approvisionnement(
      quantity: json['quantity'],
      amount: json['amount'],
      invoice: json['invoice'] ?? '',
      vehiculeId: json['vehicule'] != null ? json['vehicule']['id'] : '',
      userId: json['user'] != null ? json['user']['id'] : '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice'] = this.invoice;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['vehiculeId'] = this.vehiculeId;
    data['userId'] = this.userId;
    return data;
  }
}