import 'package:flutter/material.dart';

import '../../../shared/helpers/validate_fields.dart';

class CustomFormField extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final TextEditingController field;

  const CustomFormField({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.field,
  })  : _formKey = formKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        maxLength: 25,
        style: const TextStyle(fontSize: 20),
        controller: field,
        decoration: const InputDecoration(
          hintText: 'Digite a tarefa',
        ),
        validator: (value) => ValidadeHelp.validateTodo(value!),
      ),
    );
  }
}
