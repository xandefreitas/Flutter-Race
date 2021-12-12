import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primeiroapp/shared/theme/app_theme.dart';
import 'package:primeiroapp/shared/theme/app_text.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final Function(String)? onChanged;
  final String? Function(String)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final String? initialValue;
  const InputText({
    Key? key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.textInputType,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label).label,
        SizedBox(height: 12),
        TextFormField(
          inputFormatters: inputFormatters,
          keyboardType: textInputType,
          initialValue: initialValue,
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
