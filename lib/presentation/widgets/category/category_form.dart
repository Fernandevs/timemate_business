import 'package:flutter/material.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timemate_business/data/models/category.dart';
import 'package:timemate_business/presentation/providers/category.dart';

class CategoryForm extends ConsumerStatefulWidget {
  const CategoryForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CategoryFormState();
}

class _CategoryFormState extends ConsumerState<CategoryForm> {
  TextEditingController name = TextEditingController();
  bool isCompanyCreated = false;

  @override
  Widget build(BuildContext context) {
    final category = ref.read(categoryProvider);
    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 5),
          TextFormField(
            controller: name,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: 'Category',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some category name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              category.create(
                Category(name: name.text),
              );

              AwesomeDialog(
                width: 450,
                context: context,
                dialogType: DialogType.SUCCES,
                headerAnimationLoop: false,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Se guardó la categoría',
              ).show();
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
