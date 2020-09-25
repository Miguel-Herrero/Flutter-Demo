import 'package:auto_route/auto_route_annotations.dart';

import 'package:flutter_demo/ui/views/credits/credits_view.dart';
import 'package:flutter_demo/ui/views/home/home_viewmodel.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: CreditsView),
  ],
)
class $Router {}
