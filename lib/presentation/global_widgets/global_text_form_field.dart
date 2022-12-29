import 'package:flutter/material.dart';

class GlobalTextFormField extends StatelessWidget {
  final TextInputType? textInputType;
  final TextEditingController? textController;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final String? vaildMessage;
  final bool? isPassword;

  const GlobalTextFormField({
    super.key,
    this.textInputType,
    this.textController,
    this.decoration,
    this.validator,
    this.vaildMessage,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType ?? TextInputType.text,
      controller: textController,
      decoration: decoration,
      validator: validator ??
          (String? value) {
            if (value!.isEmpty) {
              return vaildMessage ?? 'Please fill this field';
            }
            return null;
          },
      obscureText: isPassword ?? false,
    );
  }
}
