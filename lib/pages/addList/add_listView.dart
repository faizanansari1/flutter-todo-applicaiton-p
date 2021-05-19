import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddListView extends StatelessWidget {
  final List listData;
  final Function addItems;
  const AddListView({Key key, this.listData, this.addItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey();
    TextEditingController _name = TextEditingController();
    TextEditingController _designation = TextEditingController();
    TextEditingController _age = TextEditingController();
    TextEditingController _school = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Text('Dummy Data:: ${model.value}'),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Enter Name",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter name';
                    }
                    return null;
                  },
                  controller: _name,
                  // onChanged: model.updateFilds,
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Designation",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      )),
                  // validator: validator,
                  controller: _designation,
                  // onChanged: model.updateFilds,
                ),
                SizedBox(height: 15),
                TextFormField(
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      labelText: "Age",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      )),
                  // validator: validator,
                  controller: _age,
                  // onChanged: model.updateFilds,
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "School/College",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      )),
                  // validator: validator,
                  controller: _school,
                  // onChanged: model.updateFilds,
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      onSurface: Colors.grey,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.0)),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    onPressed: () {
                      addItems(
                          name: _name.text,
                          designation: _designation.text,
                          age: _age.text,
                          school: _school.text,
                          id: listData.length);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
