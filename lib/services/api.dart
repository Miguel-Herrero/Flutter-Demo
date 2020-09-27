import 'package:flutter_demo/datamodels/post.dart';

abstract class Api {
  Future<List<Post>> getPostsForUser(int userId);
}
