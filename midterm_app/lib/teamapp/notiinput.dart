import 'package:flutter/material.dart';
import 'package:midterm_app/models/notiform.dart';
import 'package:midterm_app/teamapp/noti.dart';
import 'package:provider/provider.dart';

class Notiinput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input การแจ้งเตือน'),
        backgroundColor: Colors.deepPurple[200],
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
  String? _alert1;
  String? _alert2;
  String? _alert3;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'การแจ้งเตือน1',
                icon: Icon(Icons.notification_add_sharp),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Noti input1';
                }

                return null;
              },
              onSaved: (value) {
                _alert1 = value;
              },
              initialValue: context.read<NotiformModels>().alert1),
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'การแจ้งเตือน2',
                icon: Icon(Icons.notification_add_sharp),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Noti input2';
                }

                return null;
              },
              onSaved: (value) {
                _alert2 = value;
              },
              //save ค่าเกบไว้
              initialValue: context.read<NotiformModels>().alert2),
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'การแจ้งเตือน3',
                icon: Icon(Icons.notification_add_sharp),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Noti input3';
                }

                return null;
              },
              onSaved: (value) {
                _alert3 = value;
              },
              //save ค่าเกบไว้
              initialValue: context.read<NotiformModels>().alert3),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<NotiformModels>().alert1 = _alert1;
                context.read<NotiformModels>().alert2 = _alert2;
                context.read<NotiformModels>().alert3 = _alert3;

                Navigator.pop(context);
              }
            },
            child: Text('อัพโหลดข้อมูล'),
          ),
        ],
      ),
    );
  }
}
