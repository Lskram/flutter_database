import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("แบบฟอร์มบันทึกข้อมูล")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "ชื่อรายการ",
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "จำนวนเงิน",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text("เพิ่มข้อมูล"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
