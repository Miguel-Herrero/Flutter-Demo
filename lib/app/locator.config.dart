// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api.dart';
import '../ui/views/credits/credits_viewmodel.dart';
import '../services/fake_api.dart';
import '../services/http_api.dart';
import '../services/posts_service.dart';
import '../ui/views/posts/posts_viewmodel.dart';
import '../services/third_party_services_module.dart';

/// Environment names
const _fake = 'fake';
const _prod = 'prod';
const _dev = 'dev';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<Api>(() => FakeApi(), registerFor: {_fake});
  gh.lazySingleton<Api>(() => HttpApi(), registerFor: {_prod, _dev});
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<PostsService>(() => PostsService(get<Api>()));

  // Eager singletons must be registered in the right order
  gh.singleton<CreditsViewModel>(CreditsViewModel());
  gh.singleton<PostsViewModel>(PostsViewModel(get<PostsService>()));
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
