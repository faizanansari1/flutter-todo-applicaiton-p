import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {
  String _appTitle = "Todo List";
  String get appTitle => _appTitle;

  int _selectedIndexBottomNavBar = 0;
  int get seletedIndex => _selectedIndexBottomNavBar;

  void updateIndex(int index) {
    _selectedIndexBottomNavBar = index;
    notifyListeners();
  }
}
