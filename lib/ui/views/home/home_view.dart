import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/views/credits/credits_view.dart';
import 'package:flutter_demo/ui/views/home/home_viewmodel.dart';
import 'package:flutter_demo/ui/views/posts/posts_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[200],
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              title: Text('Posts'),
              icon: Icon(Icons.art_track),
            ),
            BottomNavigationBarItem(
              title: Text('Credits'),
              icon: Icon(Icons.list),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.navigateToHome(),
          child: Icon(Icons.chevron_right),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return PostsView();
      case 1:
        return CreditsView();
      default:
        return PostsView();
    }
  }
}
