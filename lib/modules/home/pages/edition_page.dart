import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/home_bloc.dart';
import '../../../shared/core/app_colors.dart';
import '../../../shared/core/app_fonts.dart';
import '../../../shared/helpers/snackbar_helper.dart';
import '../widgets/app_elevated_button_widget.dart';
import '../widgets/app_scafold_widget.dart';
import '../widgets/app_text_field_widget.dart';

class EditionPage extends StatefulWidget {
  final bool check;
  final String name;
  final String id;

  const EditionPage({
    super.key,
    required this.check,
    required this.name,
    required this.id,
  });
  @override
  State<EditionPage> createState() => _EditionPageState();
}

class _EditionPageState extends State<EditionPage> {
  final _editItemController =
      TextEditingController(text: Modular.args.data['name']);
  final _formKey = GlobalKey<FormState>();
  var bloc = Modular.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<HomeBloc, HomeState>(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is HomeErrorState) {
          SnackbarHelper.show(
            context,
            message: state.message,
            color: AppColors.red.getColor,
          );
        }
        if (state is HomeSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.green.getColor,
              content: Text(
                'Upadate sucess!',
                style: AppFonts.caption14W400.getFont,
                textAlign: TextAlign.center,
              ),
            ),
          );
          Future.delayed(
            const Duration(seconds: 2),
          ).then(
            (value) => Modular.to.pop(),
          );
        }
      },
      child: AppScafoldWidget(
        title: 'UPDATE TASK',
        actionAppBar: null,
        children: [
          Form(
            key: _formKey,
            child: AppTextFormFieldWidget(
              label: '',
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
          AppElevatedButtonWidget(
            onPressed: _onPressed,
            label: 'Update',
          ),
        ],
      ),
    ));
  }

  _onPressed() {
    if (_formKey.currentState!.validate()) {
      bloc.add(
        HomeEditItemEvent(
            name: _editItemController.text,
            completed: widget.check,
            id: widget.id),
      );

      FocusScope.of(context).unfocus();
      Future.delayed(const Duration(seconds: 2));
    }
  }
}
