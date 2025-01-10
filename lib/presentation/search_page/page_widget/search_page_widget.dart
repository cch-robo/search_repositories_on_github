import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories_on_github/application/publications.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';
import 'package:search_repositories_on_github/presentation/search_page/view_model/search_page_view_model.dart';
import 'package:search_repositories_on_github/presentation/ui_components/app_icon.dart';
import 'package:search_repositories_on_github/presentation/ui_components/simple_button.dart';

import '../../ui_components/progress_panel.dart';
import '../../ui_components/simple_text.dart';
import '../../ui_components/simple_textfield.dart';

part 'search_page_widget.g.dart';

@immutable
class CounterState {
  const CounterState(this.count);

  final int count;
}

@riverpod
class CounterViewModel extends _$CounterViewModel {
  CounterViewModel();

  @override
  CounterState build() {
    return const CounterState(0);
  }

  void increment() {
    state = CounterState(state.count + 1);
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final TextEditingController _readmeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _repoNameController = TextEditingController();
  final TextEditingController _topicsController = TextEditingController();

  void clear() {
    _readmeController.clear();
    _descriptionController.clear();
    _repoNameController.clear();
    _topicsController.clear();
  }

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
    _topicsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugLog('debug - SearchPage - build');
    return Stack(
      children: <Widget>[
        Scaffold(
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
                final SearchPageViewModel viewModel =
                    ref.read(searchPageViewModelProvider.notifier);

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
                              const SimpleText('topics 条件'),
                              SimpleTextField(
                                labelText: 'topics のラベルを入力してください',
                                controller: _topicsController,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // 【検索】ボタン
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SimpleButton(
                        label: '検索',
                        onPressed: (BuildContext context) async {
                          await viewModel.search(
                            readme: _readmeController.text,
                            description: _descriptionController.text,
                            repoName: _repoNameController.text,
                            topics: _topicsController.text,
                          );
                          if (viewModel.isComplete && context.mounted) {
                            ResultsPageRoute().go(context);
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        // 検索実行中のプログレス表示用
        const ProgressPanel(type: ProgressPageType.search),
      ],
    );
  }
}
