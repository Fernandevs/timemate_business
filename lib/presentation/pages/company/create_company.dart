import 'package:flutter/material.dart';
import 'package:timemate_business/presentation/widgets/category/category_form.dart';
import 'package:timemate_business/presentation/widgets/company/company_form.dart';

class CreateCompany extends StatefulWidget {
  const CreateCompany({Key? key}) : super(key: key);

  @override
  State<CreateCompany> createState() => _CreateCompanyState();
}

class _CreateCompanyState extends State<CreateCompany> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear empresa'),
      ),
      body: Stepper(
        type: StepperType.vertical,
        physics: const ScrollPhysics(),
        currentStep: _currentStep,
        onStepTapped: (step) => setState(() => _currentStep = step),
        onStepContinue: () {
          if (_currentStep < 3) {
            setState(() => _currentStep++);
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep--);
          }
        },
        steps: <Step>[
          Step(
            title: const Text('Empresa'),
            content: const CompanyForm(),
            isActive: _currentStep >= 0,
            state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Categorías'),
            content: const CategoryForm(),
            isActive: _currentStep >= 0,
            state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Servicios'),
            content: const Placeholder(),
            isActive: _currentStep >= 0,
            state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
          ),
          Step(
            title: const Text('Empleados'),
            content: const Placeholder(),
            isActive: _currentStep >= 0,
            state: _currentStep >= 3 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
