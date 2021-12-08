import 'package:primeiroapp/shared/theme/app_colors.dart';
import 'package:primeiroapp/shared/theme/text_styles.dart';

class AppTheme {
  static final AppTheme instance = AppTheme();

  final _colors = AppColors();
  static AppColors get colors => instance._colors;

  final _styles = AppTextStyle();
  static AppTextStyle get textStyles => instance._styles;
}
