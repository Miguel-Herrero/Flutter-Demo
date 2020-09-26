import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_demo/app/locator.dart';
import 'package:flutter_demo/ui/views/posts/posts_viewmodel.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsViewModel>.reactive(
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(model.title),
        ),
      ),
      viewModelBuilder: () => locator<PostsViewModel>(),
    );
  }
}
