import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repositories_on_github/domain/rest_api/rest_api_service.dart';
import 'package:search_repositories_on_github/use_case/service/search_repo_info_service.dart';

class MockRestApiService extends RestApiService {
  MockRestApiService(this.page1, this.page2, this.page3);
  final String page1;
  final String page2;
  final String page3;
  int requestIndex = 0;

  @override
  Future<Response<Map<String, dynamic>>> get({
    required String path,
    Map<String, String> header = const <String, String>{},
    Map<String, dynamic>? queries,
  }) async {
    final Response<Map<String, dynamic>> response =
        Response<Map<String, dynamic>>(
      data: json.decode(<String>[page1, page2, page3].elementAt(requestIndex++))
          as Map<String, dynamic>,
      requestOptions: RequestOptions(),
      statusCode: 200,
    );
    return response;
  }
}

class MockSearchRepoService extends SearchRepoService {
  MockSearchRepoService(super._repository);

  @override
  Future<SearchInfo?> searchRepoByInQuery({
    required BuildContext context,
    required String readme,
    required String description,
    required String repoName,
    required String topics,
  }) async {
    // 検索条件を強制的にREADME条件 "カレーライス"のみに指定して、
    // オリジナルのメソッドを呼び出す。
    readme = 'カレーライス';
    description = '';
    repoName = '';
    topics = '';

    return super.searchRepoByInQuery(
      context: context,
      readme: readme,
      description: description,
      repoName: repoName,
      topics: topics,
    );
  }
}
