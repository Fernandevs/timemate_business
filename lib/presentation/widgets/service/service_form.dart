import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timemate_business/presentation/providers/service.dart';

class Service extends ConsumerStatefulWidget {
  const Service({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ServiceState();
}

/*
TextFormField(
* */

class _ServiceState extends ConsumerState<Service> {
  @override
  Widget build(BuildContext context) {
    final service = ref.read(serviceProvider);

    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
