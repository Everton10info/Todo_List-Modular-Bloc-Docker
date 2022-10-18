import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/shared/helpers/snackbar_helper.dart';

import '../widgets/app_elevated_button_widget.dart';
import '../widgets/app_list_tile_widget.dart';
import '../widgets/app_text_field_widget.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<HomeBloc>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _addItemController = TextEditingController();
  bool check = false;

  @override
  void initState() {
    super.initState();
    bloc.add(HomeLoad());
  }

  Future<void> refreshTodo(BuildContext context) async {
    return bloc.add(
      HomeLoad(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () => refreshTodo(context),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: BlocListener<HomeBloc, HomeState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is HomeErrorState) {
            SnackbarHelper.show(
              context,
              message: state.message,
              color: Colors.red,
            );
          }
        },
        child: _buildPage(),
      ),
    );
  }

  Widget _buildPage() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextFormFieldWidget(
              controller: _addItemController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            _buildItemsList(),
            AppElevatedButtonWidget(
              onPressed: _onPressed,
              label: 'Insert',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsList() {
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        builder: ((context, state) {
          if (state is HomeInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeSuccessState) {
            return ListView.builder(
              itemCount: state.itemsTodo.length,
              itemBuilder: (context, index) {
                return Card(
                  child: AppListTileWidget(
                    title: state.itemsTodo[index].name!,
                    valueCheckBox: state.itemsTodo[index].completed!,
                    onChanged: (check) {
                      bloc.add(
                        HomeEditItemEvent(
                          name: state.itemsTodo[index].name!,
                          completed: check!,
                          id: state.itemsTodo[index].id!,
                        ),
                      );
                    },
                    onPressedEdit: () {},
                    onPressedDelete: () => bloc.add(
                      HomeDeleteItemEvent(id: state.itemsTodo[index].id!),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('Error to load list...'),
          );
        }),
      ),
    );
  }

  _onPressed() {
    if (_formKey.currentState!.validate()) {
      bloc.add(
        HomeCreateItemEvent(
          item: _addItemController.text,
          check: check,
        ),
      );
      _addItemController.text = '';
      FocusScope.of(context).unfocus();
    }
  }
}
