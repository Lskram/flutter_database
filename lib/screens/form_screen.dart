import 'package:flutter/material.dart';
import 'package:flutter_database/poviders/transaction_provider.dart';
import 'package:provider/provider.dart';

import '../models/transactions.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});

  final formKey = GlobalKey<FormState>();

  //controller
  final titleController = TextEditingController(); //รับค่าชื่อรายการ
  final amountController = TextEditingController(); //รับค่าจำนวนเงิน

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("แบบฟอร์มบันทึกข้อมูล")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "ชื่อรายการ",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกชื่อรายการ';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "จำนวนเงิน",
                  border: OutlineInputBorder(),
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกจำนวนเงิน';
                  }
                  if (double.parse(value) <= 0 ||
                      double.tryParse(value) == null) {
                    return 'ค่าเงินจะต้องไม่ลบและต้องเป็นตัวเลข';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text("เพิ่มข้อมูล"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var title = titleController.text;
                    var amount = double.parse(amountController.text);

                    Transactions statement = Transactions(
                      title: title,
                      amount: double.parse(amountController.text),
                      date: DateTime.now(),
                    );
                    //เรียกใช้ Provider หรือ Bloc เพื่อบันทึกข้อมูลที่นี่
                    //ตัวอย่างการใช้ Provider
                    var provider = Provider.of<TransactionProvider>(
                      context,
                      listen: false,
                    );
                    provider.addTransaction(statement);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
