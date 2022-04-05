import 'package:flutter/material.dart';
import 'package:notes_manager/widgets/text_field_container.dart';

class InputFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType type;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final bool hideInputText;

  const InputFieldWidget({
    Key? key,
    required this.hintText,
    required this.type,
    required this.validator,
    required this.controller,
    required this.hideInputText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        enableSuggestions: false,
        autocorrect: false,
        obscureText: hideInputText,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        validator: validator,
      ),
    );
  }
}
