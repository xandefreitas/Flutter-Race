import 'package:flutter/material.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';
import 'package:primeiroapp/shared/theme/app_text.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final Function(String)? onChanged;
  final String? Function(String)? validator;
  const InputText({
    Key? key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        SizedBox(height: 12),
        TextFormField(
          obscureText: obscure,
          style: AppTheme.textStyles.input,
          onChanged: onChanged,
          validator: (value) {
            if (validator != null) {
              return validator!(value ?? '');
            }
          },
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            hintStyle: AppTheme.textStyles.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.colors.border),
            ),
          ),
        ),
      ],
    );
  }
}
