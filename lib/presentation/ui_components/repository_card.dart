import 'package:flutter/material.dart';

/// リポジトリの名前のみを表示するカードです
class RepositoryCard extends StatelessWidget {
  const RepositoryCard({
    required void Function(BuildContext context, int id) onPressed,
    required int index,
    required String name,
    super.key,
  })  : _onPressed = onPressed,
        _index = index,
        _name = name;

  /// リポジトリ index
  final int _index;

  /// リポジトリ名
  final String _name;

  final void Function(BuildContext context, int index) _onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: GestureDetector(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.album),
                title: Text(_name),
              ),
            ],
          ),
          onTap: () => _onPressed(context, _index),
        ),
      ),
    );
  }
}
