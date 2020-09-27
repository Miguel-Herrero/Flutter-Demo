import 'package:injectable/injectable.dart';

import 'package:flutter_demo/app/locator.dart';
import 'package:flutter_demo/datamodels/post.dart';
import 'package:flutter_demo/services/api.dart';

@LazySingleton(as: Api, env: [Env.fake])
class FakeApi implements Api {
  FakeApi() {
    print('Using FakeApi service');
  }

  @override
  Future<List<Post>> getPostsForUser(int userId) async {
    await Future.delayed(Duration(seconds: 1));

    return List<Post>.generate(
      5,
      (index) => Post(
          title: 'Fake post no. ' + (index + 1).toString(),
          body:
              'Lorem fistrum se calle ustée benemeritaar está la cosa muy malar me cago en tus muelas.'),
    );
  }
}
