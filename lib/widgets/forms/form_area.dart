import 'package:flash_chat/widgets/solid_button.dart';
import 'package:flash_chat/widgets/forms/text_form_input_field.dart';
import 'package:flutter/material.dart';

class FormArea extends StatelessWidget {
  FormArea({
    required this.textFormList,
    required this.buttonLabel,
    required this.whenFormIsValid,
    this.whenFormIsInvalid,
    this.otherForm,
  });

  final List<TextFormInputField> textFormList;
  final String buttonLabel;
  final void Function() whenFormIsValid;
  final void Function()? whenFormIsInvalid;

  /// [otherForm] will insert any widgets between the TextFormFields and
  /// the form's button.
  ///
  /// only use this if you are going to add another type of form
  final Widget? otherForm;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 48),
          ..._renderTextFormList(),
          if (otherForm != null)
            Column(
              children: [
                otherForm!,
                SizedBox(height: 16),
              ],
            ),
          SolidTextButton(
            text: buttonLabel,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                whenFormIsValid();
              } else {
                if (whenFormIsInvalid != null) {
                  whenFormIsInvalid!();
                }
              }
            },
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Iterable _renderTextFormList() {
    return textFormList.map((TextFormInputField form) => Column(
          children: [
            form,
            SizedBox(height: 16),
          ],
        ));
  }

  Widget? renderOtherForms() {
    return otherForm != null ? otherForm : null;
  }
}
