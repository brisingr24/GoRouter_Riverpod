import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/navigations/screens/details.dart';
import 'package:untitled/navigations/screens/screenA.dart';
import 'package:untitled/navigations/screens/screenB.dart';
import 'package:untitled/navigations/screens/screenC.dart';
import 'package:untitled/navigations/sidebarScaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey =
GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> _shellNavigatorKey =
GlobalKey<NavigatorState>();

final goRouter = Provider<GoRouter>((ref){
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/a',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return SidebarScaffold(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/a',
            builder: (BuildContext context, GoRouterState state) {
              return const ScreenA();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'details',
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsScreen(label: 'A');
                },
              ),
            ],
          ),
          GoRoute(
            path: '/b',
            builder: (BuildContext context, GoRouterState state) {
              return const ScreenB();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'details',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const DetailsScreen(label: 'B');
                },
              ),
            ],
          ),
          GoRoute(
            path: '/c',
            builder: (BuildContext context, GoRouterState state) {
              return const ScreenC();
            },
          ),
        ],
      ),
    ],
  );
});
