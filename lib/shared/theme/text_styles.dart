import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class IAppTextStyle {
  TextStyle get label;
  TextStyle get input;
  TextStyle get hint;
  TextStyle get buttonBackgroundColor;
  TextStyle get buttonBoldTextColor;
  TextStyle get buttonTextColor;
  TextStyle get title;
  TextStyle get subtitle;
  TextStyle get listTileTitle;
  TextStyle get listTileSubtitle;
  TextStyle get chart;
}

class AppTextStyle implements IAppTextStyle {
  @override
  TextStyle get buttonBackgroundColor => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.background,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get buttonBoldTextColor => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.textColor,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get buttonTextColor => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.textColor,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get hint => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.inputNormal,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get input => GoogleFonts.inter(
        fontSize: 16,
        color: AppTheme.colors.inputNormal,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get label => GoogleFonts.inter(
        fontSize: 16,
        color: AppTheme.colors.textColor,
        fontWeight: FontWeight.bold,
      );
  @override
  TextStyle get title => GoogleFonts.inter(
        fontSize: 22,
        color: AppTheme.colors.title,
        fontWeight: FontWeight.bold,
      );
  @override
  TextStyle get subtitle => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.subtitle,
        fontWeight: FontWeight.normal,
      );
  @override
  TextStyle get listTileTitle => GoogleFonts.inter(
        fontSize: 16,
        color: AppTheme.colors.textColor,
        fontWeight: FontWeight.w500,
      );
  @override
  TextStyle get listTileSubtitle => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.textColor,
        fontWeight: FontWeight.normal,
      );
  @override
  TextStyle get chart => GoogleFonts.inter(
        fontSize: 14,
        color: AppTheme.colors.textEnabled,
        fontWeight: FontWeight.bold,
      );
}
