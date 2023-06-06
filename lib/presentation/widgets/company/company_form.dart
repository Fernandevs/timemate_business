import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:timemate_business/data/models/company.dart';
import 'package:timemate_business/presentation/providers/company.dart';

class CompanyForm extends ConsumerStatefulWidget {
  const CompanyForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CompanyFormState();
}

class _CompanyFormState extends ConsumerState<CompanyForm> {
  TextEditingController name = TextEditingController();
  TextEditingController slogan = TextEditingController();
  Color secondaryColor = Color(Colors.transparent.value);
  Color primaryColor = const Color(0xff443a49);
  bool isCompanyCreated = false;

  @override
  Widget build(BuildContext context) {
    final company = ref.read(companyProvider);

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
              labelText: 'Nombre de la empresa',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some company name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text('Color principal'),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => Color(primaryColor.value),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              setState(
                                      () =>
                                  primaryColor = const Color(0xff443a49));
                              context.pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () => context.pop(),
                            child: const Text('Aceptar'),
                          ),
                        ],
                        content: ColorPicker(
                          pickerColor: primaryColor,
                          onColorChanged: (Color value) {
                            setState(() => primaryColor = value);
                          },
                        ),
                        title: const Text('Color principal'),
                      );
                    },
                  );
                },
                child: null,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text('Color secundario'),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => Color(secondaryColor.value),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              setState(() =>
                              secondaryColor =
                                  Color(Colors.transparent.value));
                              context.pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () => context.pop(),
                            child: const Text('Aceptar'),
                          ),
                        ],
                        content: ColorPicker(
                          pickerColor: secondaryColor,
                          onColorChanged: (Color value) {
                            setState(() => secondaryColor = value);
                          },
                        ),
                        title: const Text('Color principal'),
                      );
                    },
                  );
                },
                child: null,
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: slogan,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: 'Slogan',
            ),
          ),
          const SizedBox(height: 10),
          /*
                  AwesomeDialog(
                      width: 450,
                      context: context,
                      dialogType: DialogType.SUCCES,
                      headerAnimationLoop: false,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Se insertó la empresa',
                  ).show();

                  AwesomeDialog(
                      width: 450,
                      context: context,
                      dialogType: DialogType.ERROR,
                      headerAnimationLoop: false,
                      animType: AnimType.BOTTOMSLIDE,
                      title: '${jsonDecode(response.body)['message']}',
                  ).show();
           */
          TextButton(
            onPressed: () {
              if (!isCompanyCreated) {
                company.company = Company(
                  name: name.text,
                  slogan: slogan.text.isEmpty ? null : slogan.text,
                  primaryColor: primaryColor.value.toRadixString(16),
                  secondaryColor: secondaryColor.value ==
                      Colors.transparent.value
                      ? null
                      : secondaryColor.value.toRadixString(16),
                );
                AwesomeDialog(
                  width: 450,
                  context: context,
                  dialogType: DialogType.SUCCES,
                  headerAnimationLoop: false,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Empresa guardada',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {},
                ).show();

                isCompanyCreated = true;
              } else {
                AwesomeDialog(
                  width: 450,
                  context: context,
                  dialogType: DialogType.SUCCES,
                  headerAnimationLoop: false,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Ya está creada la empresa ${company.company?.name}',
                ).show();
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
