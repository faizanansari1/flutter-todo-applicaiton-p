import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String labeltext;
  final Function onChange;
  final TextEditingController nameController;
  const CustomTextFeild(
      {Key key, @required this.labeltext, this.onChange, this.nameController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: labeltext ?? "Enter Name",
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
      controller: nameController,
      onChanged: onChange,
    );
  }
}
