import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    required String label,
    required void Function(BuildContext context) onPressed,
    super.key,
  })  : _label = label,
        _onPressed = onPressed;

  final String _label;
  final void Function(BuildContext context) _onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => _onPressed(context),
        child: Text(
          _label,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
