import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_demo/datamodels/post.dart';
import 'package:flutter_demo/services/posts_service.dart';

@singleton
class PostsViewModel extends FutureViewModel<List<Post>> {
  final PostsService _postsService;
  PostsViewModel(this._postsService);

  @override
  Future<List<Post>> futureToRun() => _postsService.getPostsForUser(1);
}
