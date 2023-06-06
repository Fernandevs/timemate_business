import 'package:flutter/material.dart';

class Options {
  final bool isSetCompany;

  Options(this.isSetCompany);

  Widget _header() => const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.amber,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 8.0,
              left: 4.0,
              child: Text(
                "Timemate",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      );

  Widget _dashboard() => ListTile(
        title: const Text('Dashboard'),
        trailing: const Icon(Icons.home),
        onTap: () {
        },
      );

  Widget _company() => ListTile(
        title: const Text('Dashboard'),
        trailing: const Icon(Icons.business),
        onTap: () {},
      );

  Widget _service() => ListTile(
        title: const Text('Servicios'),
        trailing: const Icon(Icons.home_repair_service),
        onTap: () {},
      );

  Widget _employee() => ListTile(
        title: const Text('Empleados'),
        trailing: const Icon(Icons.people_alt),
        onTap: () {},
      );

  Widget _category() => ListTile(
        title: const Text('Categorías'),
        trailing: const Icon(Icons.category),
        onTap: () {},
      );

  Widget _report() => ListTile(
        title: const Text('Reportes'),
        trailing: const Icon(Icons.bar_chart),
        onTap: () {},
      );

  Widget _appointment() => ListTile(
        title: const Text('Citas'),
        trailing: const Icon(Icons.date_range),
        onTap: () {},
      );

  List<Widget> admin() => [
        _header(),
        _dashboard(),
        if (isSetCompany) _company(),
        if (isSetCompany) _service(),
        if (isSetCompany) _employee(),
        if (isSetCompany) _category(),
        if (isSetCompany) _report(),
        if (isSetCompany) _appointment(),
      ];

  List<Widget> cashier() => [
        _header(),
        _report(),
        _appointment(),
      ];

  List<Widget> employee() => [
        _header(),
        _appointment(),
      ];

  List<Widget> manager() => [
        _header(),
        _service(),
        _employee(),
        _category(),
        _report(),
        _appointment(),
      ];
}
