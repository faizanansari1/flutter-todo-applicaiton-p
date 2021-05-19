import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class ListPageViewModel extends BaseViewModel {
  // initial List Data
  List _itemList = [
    // {
    //   "id": 0,
    //   "name": 'faizan',
    //   "designation": 'FrontEnd Developer',
    //   "age": 24,
    //   "school": 'Public School',
    // },
  ];
  List get listData => _itemList;

  // get filterObj => null;

  void addItems(
      {int id, String name, String designation, String age, String school}) {
    listData.add({
      'id': id,
      'name': name,
      'designation': designation,
      'age': age,
      'school': school
    });
    notifyListeners();
  }

  String _changeName;
  String get changeName => _changeName;

  void onChangeName(String name) {
    _changeName = name;
    notifyListeners();
  }

  void itemDelete(index) {
    _itemList.removeAt(index);
    notifyListeners();
  }

  var _filterItem;
  get filterItem => _filterItem;

  void editField(int id) {
    // listData[index]['name'] = changeName;
    final filterObj = listData.where((element) => element['id'] == id);
    _filterItem = filterObj;
    notifyListeners();
    // _itemList[id]['name'] = {...filterObj, };
    // var filterData = {...listData[id], listData.add(filterObj)};
  }

  void onSaveEidt() {
    // _itemList[index]['name'] = 'bilal';
    // listData[0] = filterItem;
    // listData.add({'name': name});
    filterItem['name'] = changeName;
    notifyListeners();
  }

  void getArry(List array) {
    _itemList = array;
    notifyListeners();
  }
}
