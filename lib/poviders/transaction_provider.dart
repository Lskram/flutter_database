import 'package:flutter/foundation.dart';
import 'package:flutter_database/models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูลรายการธุรกรรม
  List<Transaction> transactions = [];
  //ดึงข้อมูลรายการธุรกรรม
  List<Transaction> gettransactions() {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    transactions.insert(0,statement);
    notifyListeners(); // แจ้งให้ widget ที่ฟังอยู่รู้ว่าข้อมูลเปลี่ยน
  }
}
