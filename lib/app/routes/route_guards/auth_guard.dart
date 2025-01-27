import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:patidar_melap_app/app/helpers/extensions/extensions.dart';
import 'package:patidar_melap_app/app/helpers/injection.dart';
import 'package:patidar_melap_app/app/routes/app_router.dart';
import 'package:patidar_melap_app/core/data/services/auth.service.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    getIt<IAuthService>().getAccessToken().fold(() => null, (t) => log('token:$t'));
    if (resolver.isLoggedIn) {
      // if user is authenticated we continue
      resolver.next();
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(const LoginRoute());
    }
  }
}
