class Transaction {
  String id; // Assuming this is used as txnId
  double txnAmount; // Transaction amount
  String description; // Assuming this is used as txnTitle
  DateTime txnDateTime; // Transaction date and time

  // Constructor with all required fields
  Transaction({
    required this.id, // Used as txnId
    required this.txnAmount,
    required this.description, // Used as txnTitle
    required this.txnDateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'txnAmount': txnAmount,
      'description': description, // description as txnTitle for storage
      'txnDateTime': txnDateTime.toIso8601String(), // Convert DateTime to a string
    };
  }

  // Factory method to create a Transaction from Firestore data
  factory Transaction.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Transaction(
      id: documentId,
      txnAmount: data['txnAmount'] as double,
      description: data['description'] as String, // Assuming description represents the title
      txnDateTime: DateTime.parse(data['txnDateTime'] as String),
    );
  }
}
