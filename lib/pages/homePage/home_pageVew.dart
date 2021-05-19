import 'package:flutter/material.dart';
import 'package:flutter_todo_pji_app/pages/addList/add_listView.dart';
import 'package:flutter_todo_pji_app/pages/homePage/home_page_viewModel.dart';
import 'package:flutter_todo_pji_app/pages/listPage/list_pageView.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:stacked/stacked.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ListPageView(),
      // AddListView(),
      Container(
        child: Text('DELETE SECTION'),
      ),
    ];
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (conext, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.appTitle),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          selectedItemColor: Colors.white,
          currentIndex: model.seletedIndex,
          onTap: (index) {
            model.updateIndex(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
            BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    IconBadge(
                      icon: Icon(Icons.delete),
                      itemCount: 0,
                      badgeColor: Colors.red,
                      itemColor: Colors.white,
                      // hideZero: true,
                      // onTap: () {
                      //   print("TESTING THE DELETE");
                      // },
                    )
                  ],
                ),
                label: 'Delete'),
          ],
        ),
        body: tabs[model.seletedIndex],
      ),
    );
  }
}
