import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helpers/constants.dart';
import '../screen/custom_scaffold.dart';

final GoRouter myRoute = GoRouter(
  initialLocation: "/",
  redirectLimit: 3,
  errorBuilder: (context, state) {
    return CustomScaffold(child: Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [const Text('Unknown pages'), ElevatedButton(onPressed: () => context.go("/"), child: const Text("Back"))])));
  },
  navigatorKey: ConstanceData.navigatorKey,
  routes: _buildRoutes(),
);

List<RouteBase> _buildRoutes() {
  return [
    GoRoute(
      path: '/',
      parentNavigatorKey: ConstanceData.navigatorKey,
      pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation), child: child);
          },
          child: const CustomScaffold()),
      // routes: [
      // ..._staticRoutes(),
      // ],
    ),
  ];
}

Future<bool> login() async {
  return true;
}

// List<GoRoute> _staticRoutes() {
//   return [
//     GoRoute(
//       path: RouteEnum.home.name,
//       name: RouteEnum.home.name,
//       pageBuilder: (BuildContext context, GoRouterState state) => CustomTransitionPage(
//         key: state.pageKey,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation), child: child);
//         },
//         child: const CustomScaffold(
//           child: Home(),
//         ),
//       ),
//     ),
//     GoRoute(
//       path: RouteEnum.skills.name,
//       name: RouteEnum.skills.name,
//       pageBuilder: (BuildContext context, GoRouterState state) => CustomTransitionPage(
//         key: state.pageKey,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation), child: child);
//         },
//         child: const CustomScaffold(padding: EdgeInsets.symmetric(horizontal: 80, vertical: 50), child: Skills()),
//       ),
//     ),
//     GoRoute(
//       path: RouteEnum.project.name,
//       name: RouteEnum.project.name,
//       pageBuilder: (BuildContext context, GoRouterState state) => CustomTransitionPage(
//         key: state.pageKey,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation), child: child);
//         },
//         child: const CustomScaffold(padding: EdgeInsets.fromLTRB(80, 50, 50, 50), child: Projects()),
//       ),
//     ),
//     GoRoute(
//       path: RouteEnum.plugins.name,
//       name: RouteEnum.plugins.name,
//       pageBuilder: (BuildContext context, GoRouterState state) => CustomTransitionPage(
//         key: state.pageKey,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation), child: child);
//         },
//         child: const CustomScaffold(padding: EdgeInsets.fromLTRB(80, 50, 50, 0), child: Plugins()),
//       ),
//     ),
//     GoRoute(
//       path: RouteEnum.education.name,
//       name: RouteEnum.education.name,
//       pageBuilder: (BuildContext context, GoRouterState state) => CustomTransitionPage(
//         key: state.pageKey,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation), child: child);
//         },
//         child: const CustomScaffold(child: Education()),
//       ),
//     ),
//     GoRoute(
//       path: RouteEnum.contact.name,
//       name: RouteEnum.contact.name,
//       pageBuilder: (BuildContext context, GoRouterState state) => CustomTransitionPage(
//         key: state.pageKey,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutSine).animate(animation), child: child);
//         },
//         child: const CustomScaffold(child: ContactMe()),
//       ),
//     ),
//   ];
// }

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text("Loading..."),
          ],
        ),
      ),
    );
  }
}
