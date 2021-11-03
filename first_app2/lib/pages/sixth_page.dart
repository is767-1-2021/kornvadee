import 'package:first_app2/models/first_form_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SixthPage extends StatelessWidget {
// อันนี้เสดแล้ว ctrl + . แล้วเลือกคำสั่ง import material
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Form'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  // recommend สร้าง stateless ก่อน แล้วค่อย convert to stateful >> stateful ไว้เก็บข้อมูล
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  //_คือตัวแปรจะใช้ได้ที่หน้านี้เท่านั้น โดย? คือ null ได้
  String? _lastName;
  int? _age;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your firstname:',
                icon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Your firstname please....';
                }
                //condition if null then return ...

                return null;
              },
              onSaved: (value) {
                _firstName = value;
              },
              //save ค่าเกบไว้
              initialValue: context.read<FirstFormModel>().firstName),
          TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your lastname:',
                icon: Icon(Icons.insights),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Your lastname please....';
                }

                return null;
              },
              onSaved: (value) {
                _lastName = value;
              },
              initialValue: context.read<FirstFormModel>().lastName),
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your age:',
              icon: Icon(Icons.campaign),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your age.';
              }
              //condition1
              if (int.parse(value) < 18) {
                return 'Please enter your valid age.';
              }
              //condition2
              return null;
            },
            onSaved: (value) {
              _age = int.parse(value!);
              //int.parse คือแปลง value > string (onsave+nulll check)
            },
            // ขาส่ง
            initialValue: context.read<FirstFormModel>().age.toString(),

            // เก็บค่าเอาไว้ ให้ย้อนกลับไปค่าก้ยังค้างอยู่ และสามารถแก้ไขได้
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<FirstFormModel>().firstName = _firstName;
                context.read<FirstFormModel>().lastName = _lastName;
                context.read<FirstFormModel>().age = _age;

                // var response = 'Hooooorayyyyyyyy  $_firstName $_lastName $_age';
                //validate ผ่านก่อนถึง save > โดยsave จะทำงานก้ต่อเมื่อมี onsave
                //! ถ้า validate เป็น null

                Navigator.pop(context);
              }
            },
            child: Text('Validate'),
          ),
        ],
      ),
    );
  }
}
