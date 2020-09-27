import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:mockito/mockito.dart';

import 'package:flutter_demo/services/api.dart';
import 'package:flutter_demo/services/posts_service.dart';

import 'di/locator.dart';

@injectable.LazySingleton(as: Api)
class MockApi extends Mock implements Api {}

void main() {
  group('PostService test | ', () {
    setUpAll(() {
      setupLocator();
      locator.allowReassignment = true;
    });

    test('Constructing Service should find correct dependencies', () async {
      final mockApi = locator<Api>();
      var postService = PostsService(mockApi);
      expect(postService != null, true);
    });

    test('Given user 1, should call api with user 1', () async {
      final mockApi = locator<Api>();
      var postService = PostsService(mockApi);

      await postService.getPostsForUser(1);
      verify(mockApi.getPostsForUser(1));
    });
  });
}
