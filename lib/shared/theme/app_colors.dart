import 'package:flutter/material.dart';

abstract class IAppColors {
  Color get primary;
  Color get buttonDisabled;
  Color get textDisabled;
  Color get textEnabled;
  Color get inputNormal;
  Color get background;
  Color get iconInactive;
  Color get textColor;
  Color get badColor;
  Color get border;
}

class AppColors implements IAppColors {
  @override
  Color get background => Color(0xFFF7F7F7);

  @override
  Color get badColor => Color(0xFFE45851);

  @override
  Color get buttonDisabled => Color(0xFFABABAB);

  @override
  Color get iconInactive => Color(0xFF8C8C8C);

  @override
  Color get inputNormal => Color(0xFF949B9C);

  @override
  Color get primary => Color(0xFF27AE60);

  @override
  Color get textColor => Color(0xFF272727);

  @override
  Color get textDisabled => Color(0xFFD9D9D9);

  @override
  Color get textEnabled => Color(0xFFFFFFFF);

  @override
  Color get border => Color(0xFFE9E9EC);
}
