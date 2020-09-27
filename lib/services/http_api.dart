import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'package:flutter_demo/app/locator.dart';
import 'package:flutter_demo/datamodels/post.dart';
import 'package:flutter_demo/services/api.dart';

@LazySingleton(as: Api, env: [Env.prod, Env.dev, Env.test])
class HttpApi implements Api {
  HttpApi() {
    print('Using HttpApi service');
  }

  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

  @override
  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    var response = await client.get('$endpoint/posts?userId=$userId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }
}
