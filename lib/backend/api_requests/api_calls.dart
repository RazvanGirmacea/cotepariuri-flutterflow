import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class HomepageAziMeciuriLiveCall {
  static Future<ApiCallResponse> call({
    String? language = 'ro',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Homepage azi  meciuri live',
      apiUrl:
          'https://sports.esportsbettingtop.com/api/match/index?language=${language}&groupby=series&date=today,tomorrow&status=live,upcoming&has-odd=1&json=1&no-cache=1&token=qg3uvsr356ss67xnwns&nonce=78e1e7ed9d',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static List? matchesGrouped(dynamic response) => getJsonField(
        response,
        r'''$.matchesGrouped''',
        true,
      ) as List?;
  static List? bookmakers(dynamic response) => getJsonField(
        response,
        r'''$.bookmakers''',
        true,
      ) as List?;
  static List? matches(dynamic response) => getJsonField(
        response,
        r'''$.matchesGrouped[:].matches''',
        true,
      ) as List?;
  static List<String>? groupedFullName(dynamic response) => (getJsonField(
        response,
        r'''$.matchesGrouped[:].full_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leagueName(dynamic response) => (getJsonField(
        response,
        r'''$.matchesGrouped[:].league.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countryFlag(dynamic response) => (getJsonField(
        response,
        r'''$.matchesGrouped[:].country.logo_so_original''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? countryName(dynamic response) => (getJsonField(
        response,
        r'''$.matchesGrouped[:].country.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? groupID(dynamic response) => (getJsonField(
        response,
        r'''$.matchesGrouped[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.matchesGrouped[:].matches[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? leagueLogo(dynamic response) => (getJsonField(
        response,
        r'''$.matchesGrouped[:].league.logo_so_small''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? dateTime(dynamic response) => (getJsonField(
        response,
        r'''$.matchesGrouped[:].matches[:].events[:].date_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class MatchAPICall {
  static Future<ApiCallResponse> call({
    String? series = 'intl%20friendies',
    int? matchId = 541692,
    String? language = 'ro',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Match API',
      apiUrl:
          'https://sports.esportsbettingtop.com/api/wp-page/match?sport=football&series=${series}&match_id=${matchId}&language=${language}&token=qg3uvsr356ss67xnwns',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LeagueAPICall {
  static Future<ApiCallResponse> call({
    String? league = '',
    String? language = 'ro',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'League API',
      apiUrl:
          'https://sports.esportsbettingtop.com/api/match/index?serie-slug=${league}&language=${language}&limit=8&status=live,upcoming&json=1&has-odd=1&token=qg3uvsr356ss67xnwns&nonce=78e1e7ed9d',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
