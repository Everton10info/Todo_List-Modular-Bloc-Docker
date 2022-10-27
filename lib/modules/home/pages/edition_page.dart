import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/modules/home/bloc/home_bloc.dart';

import '../widgets/app_text_field_widget.dart';

class EditionPage extends StatefulWidget {
  const EditionPage({super.key});

  @override
  State<EditionPage> createState() => _EditionPageState();
}

class _EditionPageState extends State<EditionPage> {
  final _editItemController =
      TextEditingController(text: '${Modular.args.data.name}');
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('UPDATE TASK'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 24,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formKey,
                child: AppTextFormFieldWidget(
                  controller: _editItemController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bloc.add(HomeEditItemEvent(
                        name: _editItemController.text,
                        completed: Modular.args.data.completed,
                        id: Modular.args.data.id,
                      ));

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Update sucess'),
                        ),
                      );
                      await Future.delayed(const Duration(seconds: 2));
                      Modular.to.pop();
                    }
                  },
                  child: const Text('Save'))
            ]),
      ),
    ));
  }
}
