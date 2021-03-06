import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'package:flutter_demo/app/locator.dart';
import 'package:flutter_demo/ui/views/credits/credits_viewmodel.dart';

class CreditsView extends StatelessWidget {
  const CreditsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreditsViewModel>.reactive(
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(model.title),
        ),
      ),
      viewModelBuilder: () => locator<CreditsViewModel>(),
    );
  }
}
