import 'package:go_router/go_router.dart';

import 'package:timemate_business/presentation/pages/auth/login.dart';
import 'package:timemate_business/presentation/pages/company/create_company.dart';
import 'package:timemate_business/presentation/pages/dashboard/dashboard.dart';
import 'package:timemate_business/presentation/pages/home.dart';
import 'package:timemate_business/presentation/pages/not_found/not_found.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => const Login(),
      routes: <RouteBase>[
        GoRoute(
          path: 'dashboard',
          name: 'dashboard',
          builder: (context, state) => const Dashboard(),
          routes: <RouteBase>[
            GoRoute(
              path: 'create',
              name: 'create_company',
              builder: (context, state) => const CreateCompany(),
            ),
          ],
        ),
        GoRoute(
          path: 'home',
          name: 'home',
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: 'not_found',
          name: 'not_found',
          builder: (context, state) => const NotFound(),
        ),
      ],
    ),
  ],
);
