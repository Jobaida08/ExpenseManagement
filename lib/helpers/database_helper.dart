import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/transaction.dart' as model;  // Ensure correct path

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  final CollectionReference transactionCollection = FirebaseFirestore.instance.collection('transactions');

  Future<void> addTransaction(model.Transaction transaction) async {
    await transactionCollection.doc(transaction.id).set(transaction.toMap());
  }

  Future<List<model.Transaction>> getTransactions() async {
    QuerySnapshot querySnapshot = await transactionCollection.get();
    return querySnapshot.docs.map((doc) => model.Transaction.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<void> updateTransaction(model.Transaction transaction) async {
    await transactionCollection.doc(transaction.id).update(transaction.toMap());
  }

  Future<void> deleteTransaction(String id) async {
    await transactionCollection.doc(id).delete();
  }

  // Method to get all transactions
  Future<List<model.Transaction>> getAllTransactions() async {
    QuerySnapshot querySnapshot = await transactionCollection.get();
    return querySnapshot.docs.map((doc) => model.Transaction.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

}
