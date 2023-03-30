import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_apps/models/news.dart';
import 'package:navigator_apps/modul/home/home_screen.dart';
import 'package:navigator_apps/modul/news_detail/new_detail_screen.dart';

import '../models/user.dart';
import '../modul/splashscreen/splash_screen.dart';

class AppRoutes {
  static const String splash = 'splash';
  static const String home = 'home';
  static const String newDetail = 'news-detail';
  static const String profile = 'profile';

  static Page _splashScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      key: state.pageKey,
      child: const SplashScreen(),
    );
  }

  static Page _homeScreenRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    late User user;
    if (state.extra != null && state.extra is User) {
      user = state.extra as User;
    } else {
      user = User(
        id: 000,
        name: "Dimas Wahyudi",
        userName: "dimss",
        email: "2006132@itg.ac.id",
        profileImage:
            "https://scontent.fbdo1-1.fna.fbcdn.net/v/t39.30808-6/305018979_605846424223993_304249551851919614_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=174925&_nc_eui2=AeGAEbCH6syTFrAz_GjRv0CNB0w_yJHkpPgHTD_IkeSk-Mf0tGP44oNsuc5RC1C4LjqPk9B7Fpdzx2GsBOh0pte-&_nc_ohc=BM_f_92UsWkAX-3_k7F&_nc_zt=23&_nc_ht=scontent.fbdo1-1.fna&oh=00_AfAYbRFvnJTYaRUK0UQawnRPTIaQ88-OcY-xvXSblKw8Yg&oe=642A2FDC",
        phoneNumber: "082124562992",
      );
    }
    return CustomTransitionPage(
      child: HomeScreen(key: state.pageKey, user: user),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  static Page _newDetailRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    if (state.params['id'] != null) {
      return MaterialPage(
          child: NewsDetailScreen(
        news: state.extra as News,
      ));
    } else {
      return const MaterialPage(
          child: Scaffold(
        body: Center(
          child: Text("Data Not Found"),
        ),
      ));
    }
  }

  static final GoRouter goRouter = GoRouter(
    routerNeglect: true,
    routes: [
      GoRoute(
        name: splash,
        path: "/splash",
        pageBuilder: _splashScreenRouteBuilder,
      ),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenRouteBuilder,
      ),
      GoRoute(
        name: newDetail,
        path: "/news-detail/:id",
        pageBuilder: _newDetailRouteBuilder,
      ),
    ],
    initialLocation: "/splash",
  );
}
