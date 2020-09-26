import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:flutter_demo/app/router.gr.dart';
import 'package:flutter_demo/app/locator.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String _title = 'My app';
  String get title => _title;

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.creditsView);
  }
}
