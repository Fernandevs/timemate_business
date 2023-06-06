import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import 'package:timemate_business/helpers/options.dart';
import 'package:timemate_business/presentation/providers/auth.dart';
import 'package:timemate_business/presentation/providers/company.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final company = ref.read(companyProvider);
    final auth = ref.read(authProvider);
    late final List<Widget> options;
    late final bool isCompanySet;
    late final Options option;
    late final String role;

    if (auth.user == null){
      context.goNamed('login');
    }

    role = auth.user!.role;

    isCompanySet = company.company != null;

    print('Company is ${company.company != null}');

    if (isCompanySet) {
      context.goNamed('dashboard');
    }

    option = Options(isCompanySet);

    switch (role) {
      case 'admin':
        options = option.admin();
        context.goNamed('dashboard');
        break;
      case 'cashier':
        options = option.cashier();
        break;
      case 'employee':
        options = option.employee();
        break;
      case 'manager':
        options = option.manager();
        break;
      default:
        options = [];
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Timemate'),
        actions: <Widget>[
          Center(
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                auth.logout();
                context.goNamed('login');
              },
            )
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 10,
        child: ListView(
          padding: EdgeInsets.zero,
          children: options,
        ),
      ),
    );
  }
}
