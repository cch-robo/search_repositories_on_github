import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  const SimpleText(
    String label, {
    bool isSmell = false,
    super.key,
  })  : _label = label,
        _isSmall = isSmell;

  final String _label;
  final bool _isSmall;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      child: Text(
        _label,
        style: _isSmall
            ? Theme.of(context).textTheme.titleLarge
            : Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
