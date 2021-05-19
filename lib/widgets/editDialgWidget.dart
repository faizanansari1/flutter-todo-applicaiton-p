import 'package:flutter/material.dart';
import 'package:flutter_todo_pji_app/pages/listPage/list_page_viewModel.dart';
import 'package:stacked/stacked.dart';

class EditDialogWidget extends StatefulWidget {
  final int index;
  final int id;
  final String name;
  final String designation;
  final int age;
  final String school;
  final ValueChanged onChangeTitle;
  final ValueChanged onChangeDesignation;
  final ValueChanged onChangeAge;
  final ValueChanged onChangeSchool;
  final dataList;

  const EditDialogWidget(
      {Key key,
      this.dataList,
      this.index,
      this.id,
      this.name,
      this.designation,
      this.age,
      this.school,
      this.onChangeTitle,
      this.onChangeDesignation,
      this.onChangeAge,
      this.onChangeSchool})
      : super(key: key);

  @override
  _EditDialogWidgetState createState() => _EditDialogWidgetState();
}

class _EditDialogWidgetState extends State<EditDialogWidget> {
  String text;
  @override
  Widget build(BuildContext context) {
    // final dataList = widget.dataList[0];
    return ViewModelBuilder<ListPageViewModel>.reactive(
      viewModelBuilder: () => ListPageViewModel(),
      builder: (context, model, child) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Todo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 20),
            buildTitle(),
            SizedBox(height: 20),
            buildDesignation(),
            SizedBox(height: 20),
            buildAge(),
            SizedBox(height: 20),
            buildSchool(),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Save'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () {
                  print("CHEKINNG LIST ${widget.dataList[0][0]}");
                  print("CHEKINNG LIST MODEL ${model.listData}");

                  // model.editField(id);
                  // model.onSaveEidt);
                  // model.getArry(widget.dataList);
                  setState(() {
                    widget.dataList[0][0]["name"] = text;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: widget.name,
        onChanged: (value) {
          text = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'The name connot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: "Title",
        ),
      );

  Widget buildDesignation() => TextFormField(
        maxLines: 1,
        initialValue: widget.designation,
        onChanged: widget.onChangeDesignation,
        decoration: InputDecoration(
            border: UnderlineInputBorder(), labelText: 'Designation'),
      );

  Widget buildAge() => TextFormField(
        maxLines: 1,
        initialValue: widget.age.toString(),
        onChanged: widget.onChangeAge,
        decoration:
            InputDecoration(border: UnderlineInputBorder(), labelText: 'Age'),
      );

  Widget buildSchool() => TextFormField(
        initialValue: widget.school,
        onChanged: widget.onChangeSchool,
        decoration: InputDecoration(
            border: UnderlineInputBorder(), labelText: 'School/College'),
      );
}
