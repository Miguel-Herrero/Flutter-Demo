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
        body: model.isBusy
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.purple[200]),
                    ),
                    Text(
                      'Loading Posts',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )
            : !model.hasError
                ? buildPostsList(context, model)
                : Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      model.error.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
      ),
      viewModelBuilder: () => locator<PostsViewModel>(),
    );
  }

  Widget buildPostsList(BuildContext context, PostsViewModel model) {
    return ListView.separated(
        key: PageStorageKey('storage-key'),
        padding: const EdgeInsets.only(top: 55),
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: model.data.length,
        itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          model.data[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          model.data[index].body,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Icon(
                      Icons.star,
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            ));
  }
}
