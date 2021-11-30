import 'package:final_app/datacontroller.dart';
import 'package:final_app/dataservices.dart';
import 'package:final_app/listviewexp.dart';
import 'package:flutter/material.dart';

class Datainput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please fill in expense'),
        backgroundColor: Colors.green[700],
      ),
      body: InputForm(),
    );
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  String icon = '';
  String transactions = '';
  // int amount = 0;
  String amount = '';
  String date = '';

  var service = DataServices();
  var controller;

  _InputFormState() {
    controller = DataController(service);
  }

  _addData(String icon, String transactions, String amount, String date) async {
    await controller.addData(icon, transactions, amount, date);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Please add icon :',
              icon: Icon(Icons.assignment_turned_in_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'ยังไม่ได้อัพเดท icon';
              }
              return null;
            },
            onSaved: (value) {
              icon = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Please add transactions :',
              icon: Icon(Icons.border_color_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'ยังไม่ได้อัพเดทรายการ';
              }
              return null;
            },
            onSaved: (value) {
              transactions = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Please add amount :',
              icon: Icon(Icons.attach_money_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'ยังไม่ได้อัพเดทจำนวน';
              }
              return null;
            },
            onSaved: (value) {
              // amount = value! as int;
              amount = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Please add date (dd Mmm yyyy):',
              icon: Icon(Icons.calendar_today),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'ยังไม่ได้อัพเดทวันที่';
              }
              return null;
            },
            onSaved: (value) {
              date = value!;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              _addData(icon, transactions, amount, date);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => View(),
                ),
              );
            },
            child: Text('Upload data'),
          ),
        ],
      ),
    );
  }
}
