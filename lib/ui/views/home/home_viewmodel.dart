import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(model.title),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
