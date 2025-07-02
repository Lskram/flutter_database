import 'package:flutter/foundation.dart';
import 'package:flutter_database/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูลรายการธุรกรรม
  List<Transaction> transactions = [
    Transaction(title: "ซื้อหนังสือ", amount: 500, date: DateTime.now()),
    Transaction(title: "จ่ายค่าไฟ", amount: 1500, date: DateTime.now()),
    Transaction(title: "ซื้อของชำ", amount: 300, date: DateTime.now()),
    Transaction(title: "ค่าบริการอินเทอร์เน็ต", amount: 800  , date: DateTime.now()),
    Transaction(title: "ค่าซ่อมรถ", amount: 2000, date: DateTime.now()),
  ];
  //ดึงข้อมูลรายการธุรกรรม
  List<Transaction> gettransactions() {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    transactions.add(statement);
  }
}
