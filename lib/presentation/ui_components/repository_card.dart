import 'package:flutter/material.dart';

/// リポジトリの名前のみを表示するカードです
class RepositoryCard extends StatelessWidget {
  const RepositoryCard({
    required void Function(BuildContext context, int id) onPressed,
    required int id,
    required String name,
    super.key,
  })  : _onPressed = onPressed,
        _id = id,
        _name = name;

  /// リポジトリID
  final int _id;

  /// リポジトリ名
  final String _name;

  final void Function(BuildContext context, int id) _onPressed;

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
          onTap: () => _onPressed(context, _id),
        ),
      ),
    );
  }
}
