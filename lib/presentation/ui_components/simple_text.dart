import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  const SimpleText(
    String label, {
    FontSize? size,
    super.key,
  })  : _label = label,
        _fontSize = size;

  final String _label;
  final FontSize? _fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      child: Text(
        _label,
        style: parseFontSize(context, _fontSize),
      ),
    );
  }
}

enum FontSize {
  large,
  medium,
  small;
}

enum TextType {
  display,
  headline,
  title,
  body,
  label;
}

TextStyle parseFontSize(BuildContext context, FontSize? size) {
  final TextTheme textTheme = Theme.of(context).textTheme;
  if (size == null) {
    return textTheme.headlineSmall!;
  }
  return switch (size) {
    FontSize.large => textTheme.titleLarge!,
    FontSize.medium => textTheme.titleMedium!,
    FontSize.small => textTheme.titleSmall!,
  };
}
