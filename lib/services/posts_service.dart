import 'package:injectable/injectable.dart';

import 'package:flutter_demo/datamodels/post.dart';
import 'package:flutter_demo/services/api.dart';

@lazySingleton
class PostsService {
  final Api _api;
  PostsService(this._api);

  List<Post> _posts;
  List<Post> get posts => _posts;

  bool get hasPosts => _posts != null && _posts.isNotEmpty;

  Future<List<Post>> getPostsForUser(int userId) async {
    _posts = await _api.getPostsForUser(userId);
    return _posts;
  }
}
