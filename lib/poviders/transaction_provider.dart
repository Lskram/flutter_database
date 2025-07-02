import 'package:flutter/foundation.dart';
import 'package:flutter_database/models/transactions.dart';

class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูลรายการธุรกรรม
  List<Transactions> transactions = [];
  //ดึงข้อมูลรายการธุรกรรม
  List<Transactions> gettransactions() {
    return transactions;
  }

  void addTransaction(Transactions statement) {
    transactions.insert(0,statement);
    notifyListeners(); // แจ้งให้ widget ที่ฟังอยู่รู้ว่าข้อมูลเปลี่ยน
  }
}
