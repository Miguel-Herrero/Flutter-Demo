import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@singleton
class PostsViewModel extends BaseViewModel {
  String _title = 'Posts';
  String get title => _title;
}
