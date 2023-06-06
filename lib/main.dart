import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timemate_business/config/app_theme.dart';
import 'package:timemate_business/presentation/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: Timemate(),
    ),
  );
}

class Timemate extends ConsumerWidget {
  const Timemate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: router,
      title: 'Busy Bee',
    );
  }
}
