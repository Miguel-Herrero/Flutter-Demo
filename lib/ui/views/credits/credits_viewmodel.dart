import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@singleton
class CreditsViewModel extends BaseViewModel {
  String _title = 'Credits page';
  String get title => _title;
}
