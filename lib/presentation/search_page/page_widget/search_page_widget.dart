import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/application/publications.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';
import 'package:search_repositories_on_github/presentation/ui_components/app_icon.dart';
import 'package:search_repositories_on_github/presentation/ui_components/simple_button.dart';

import '../../ui_components/simple_text.dart';
import '../../ui_components/simple_textfield.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final TextEditingController _readmeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _repoNameController = TextEditingController();
  final TextEditingController _repoOwnerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //
  }

  @override
  void dispose() {
    _readmeController.dispose();
    _descriptionController.dispose();
    _repoNameController.dispose();
    _repoOwnerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugLog('debug - SearchPage - build');
    return Scaffold(
      appBar: AppBar(
        leading: const AppIcon(),
        title: Text(l10n(context).appTitle),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Column(
              children: <Widget>[
                // スクロール可能なコンテンツ
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          const SimpleText('GitHub リポジトリ検索'),
                          const SimpleText(
                            '検索条件を指定してください。',
                            size: FontSize.large,
                          ),
                          const SizedBox(height: 20),
                          const SimpleText('README 条件'),
                          SimpleTextField(
                            labelText: 'README に含まれるテキストを入力してください',
                            controller: _readmeController,
                          ),
                          const SizedBox(height: 20),
                          const SimpleText('description 条件'),
                          SimpleTextField(
                            labelText: 'description に含まれるテキストを入力してください',
                            controller: _descriptionController,
                          ),
                          const SizedBox(height: 20),
                          const SimpleText('リポジトリ名 条件'),
                          SimpleTextField(
                            labelText: 'リポジトリ名 に含まれるテキストを入力してください',
                            controller: _repoNameController,
                          ),
                          const SizedBox(height: 20),
                          const SimpleText('オーナー名 条件'),
                          SimpleTextField(
                            labelText: 'リポジトリオーナの名前を入力してください',
                            controller: _repoOwnerController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // 固定ボタン
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SimpleButton(
                    label: '検索',
                    onPressed: (BuildContext context) {
                      ResultsPageRoute().go(context);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
