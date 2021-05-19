import 'package:flutter/material.dart';
import 'package:flutter_todo_pji_app/pages/addList/add_listView.dart';
import 'package:flutter_todo_pji_app/pages/listPage/list_page_viewModel.dart';
import 'package:flutter_todo_pji_app/widgets/editDialgWidget.dart';
import 'package:stacked/stacked.dart';

class ListPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('RE-Build');

    return ViewModelBuilder<ListPageViewModel>.reactive(
      viewModelBuilder: () => ListPageViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: model.listData.length,
            itemBuilder: (_, index) => Card(
              elevation: 5,
              child: ListTile(
                title: Text('${model.listData[index]['name']}'),
                subtitle: Text('${model.listData[index]['designation']}'),
                trailing: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => EditDialogWidget(
                              onChangeTitle: (value) =>
                                  model.onChangeName(value),
                              name: model.listData[index]['name'],
                              id: model.listData[index]['id'],
                              index: index,
                              dataList: [model.listData],
                            ),
                            barrierDismissible: false,
                          );
                          // model.editField(model.listData[index]);
                          // print("VALUE:: ${model.filterItem}");
                          // model.editField(model.listData[index]['id']);
                        },
                      ),
                      SizedBox(width: 10),
                      IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // model.itemDelete(index);
                            print('FILTER OBJECT${model.filterItem}');
                            print('CHECK DATA${model.listData}');
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddListView(
                          listData: model.listData,
                          addItems: model.addItems,
                        )));
          },
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
    );
  }
}
