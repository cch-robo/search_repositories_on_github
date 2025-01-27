import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories_on_github/application/publications.dart';
import 'package:search_repositories_on_github/foundation/publications.dart';

import '../../shared_state_on_pages/state/search_condition_state.dart';
import '../../ui_components/app_icon.dart';
import '../../ui_components/progress_panel.dart';
import '../../ui_components/simple_button.dart';
import '../../ui_components/simple_text.dart';
import '../../ui_components/simple_textfield.dart';
import '../view_model/search_page_view_model.dart';

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
  void didChangeDependencies() {
    // 狭小画面デバイス及び、ソフトキーボード高が大きいものがあるため、
    // 画面方向を（縦方向のみ）に指定
    unawaited(
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
      ]),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // 画面方向指定解除（全方向指定）
    unawaited(
      SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]),
    );

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
                              SimpleText(l10n(context).searchPageSubTitle),
                              SimpleText(
                                l10n(context).searchRequest,
                                size: FontSize.large,
                              ),
                              const SizedBox(height: 20),
                              SimpleText(l10n(context).searchConditionReadme),
                              SimpleTextField(
                                labelText:
                                    l10n(context).searchConditionReadmeRequest,
                                controller: _readmeController,
                              ),
                              const SizedBox(height: 20),
                              SimpleText(
                                l10n(context).searchConditionDescription,
                              ),
                              SimpleTextField(
                                labelText: l10n(context)
                                    .searchConditionDescriptionRequest,
                                controller: _descriptionController,
                              ),
                              const SizedBox(height: 20),
                              SimpleText(l10n(context).searchConditionRepoName),
                              SimpleTextField(
                                labelText:
                                    l10n(context).searchConditionRepoNamRequest,
                                controller: _repoNameController,
                              ),
                              const SizedBox(height: 20),
                              SimpleText(l10n(context).searchConditionTopics),
                              SimpleTextField(
                                labelText:
                                    l10n(context).searchConditionTopicsRequest,
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
                        label: l10n(context).searchButton,
                        onPressed: (BuildContext context) async {
                          await viewModel.search(
                            context: context,
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
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            // プログレス表示を行わせるプロバイダの state を監視する。
            final Condition condition =
                ref.watch(searchPageViewModelProvider).condition;

            // 検索実行中のプログレス表示用
            return ProgressPanel(isProgress: Condition.searching == condition);
          },
        ),
      ],
    );
  }
}
