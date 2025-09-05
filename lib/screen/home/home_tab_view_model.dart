class ItemModel {
  String itemName;
  String amount;
  String unitName;
  String rate;
  String image;

  ItemModel({
    required this.itemName,
    required this.amount,
    required this.unitName,
    required this.rate,
    required this.image,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      itemName: json['item_name'] ?? '',
      amount: json['amount'] ?? '',
      unitName: json['unit_name'] ?? '',
      rate: json['rate'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "item_name": itemName,
      "amount": amount,
      "unit_name": unitName,
      "rate": rate,
      "image": image,
    };
  }
}
