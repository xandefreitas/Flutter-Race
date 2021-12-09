import 'package:flutter/material.dart';

import 'app_theme.dart';

class TextExtension {}

extension TextExt on Text {
  Text get label => Text(
        // ignore: unnecessary_this
        this.data!,
        style: AppTheme.textStyles.label,
      );
}
