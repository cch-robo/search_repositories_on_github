import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({
    required String labelText,
    required TextEditingController controller,
    super.key,
  })  : _labelText = labelText,
        _controller = controller;

  final String _labelText;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      child: TextField(
        controller: _controller,
        maxLength: 80,
        decoration: InputDecoration(
          hintText: _labelText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
