import 'package:flutter/material.dart';

import '../bloc/todo_bloc.dart';

class CustomElevatedButon extends StatelessWidget {
  final GlobalKey<FormState> _formKey;
  final TodoBloc bloc;
  final TextEditingController field;
  final bool check;

  const CustomElevatedButon({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.bloc,
    required this.field,
    required this.check,
  })  : _formKey = formKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            bloc.add(
              TodoInsert(
                item: field.text,
                check: check,
              ),
            );
            field.text = '';
            FocusScope.of(context).unfocus();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text('Campo precisar ter no mínimo 3 caracteres!')));
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Insert'));
  }
}
