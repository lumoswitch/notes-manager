import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final VoidCallback? onPressedAction;
  final Text buttonText;
  const ActionButtonWidget({
    Key? key,
    required this.onPressedAction,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        child: buttonText,
        onPressed: onPressedAction,
      ),
    );
  }
}
