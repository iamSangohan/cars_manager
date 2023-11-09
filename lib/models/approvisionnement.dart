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
      invoice: json['invoice'],
      quantity: json['quantity'],
      amount: json['amount'],
      vehiculeId: json['vehiculeId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice'] = invoice;
    data['quantity'] = quantity;
    data['amount'] = amount;
    data['vehiculeId'] = vehiculeId;
    data['userId'] = userId;
    return data;
  }
}
