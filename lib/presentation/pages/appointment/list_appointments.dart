import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:timemate_business/data/models/appointment.dart';
import 'package:timemate_business/presentation/providers/appointment.dart';
import 'package:timemate_business/presentation/widgets/item.dart';

class ListAppointments extends ConsumerWidget {
  const ListAppointments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointment = ref.watch(appointmentProvider);
    return FutureBuilder<List<Appointment>>(
      future: appointment.fetchAppointments(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Item(
                title: snapshot.data![index].service.name,
                subtitle: snapshot.data![index].dateTime.toString(),
                onTap: () {
                  context.goNamed('home');
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
