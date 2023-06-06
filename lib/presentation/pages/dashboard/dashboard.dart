import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:timemate_business/data/models/roles.dart';
import 'package:timemate_business/presentation/providers/auth.dart';
import 'package:timemate_business/presentation/providers/company.dart';
import 'package:timemate_business/presentation/widgets/item.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider);
    final company = ref.read(companyProvider);

    if (auth.user?.role != ValidRoles.admin.role) {
      context.goNamed('not_found');
    }

    return Scaffold(
      body: FutureBuilder(
        future: company.fetchCompanies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Item(
                  title: snapshot.data![index].name,
                  subtitle: snapshot.data![index].slogan ?? '(Slogan)',
                  trailing: CircleAvatar(
                    backgroundColor: Color(int.parse(snapshot.data![index].primaryColor, radix: 16)),
                    child: const Icon(Icons.business),
                  ),
                  onTap: () {
                    company.fetchCompany(snapshot.data![index].id!);
                    context.goNamed('home');
                  },
                );
              },
            );
          } else if (snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed('create_company');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
