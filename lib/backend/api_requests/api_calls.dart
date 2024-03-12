import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start navigi-service Group Code

class NavigiServiceGroup {
  static String baseUrl = 'https://stage-navigi-service.helpseeker.org/';
  static Map<String, String> headers = {};
  static GetMessageCall getMessageCall = GetMessageCall();
  static GetOrgDataCall getOrgDataCall = GetOrgDataCall();
  static GetOrganizationByIdCall getOrganizationByIdCall =
      GetOrganizationByIdCall();
  static GetProgramByIdCall getProgramByIdCall = GetProgramByIdCall();
  static GetCategoriesCall getCategoriesCall = GetCategoriesCall();
  static GetRegionByNameCall getRegionByNameCall = GetRegionByNameCall();
  static GetRegionByGeoCodeCall getRegionByGeoCodeCall =
      GetRegionByGeoCodeCall();
  static GetAllListingsByRegionCall getAllListingsByRegionCall =
      GetAllListingsByRegionCall();
}

class GetMessageCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMessage',
      apiUrl: '${NavigiServiceGroup.baseUrl}/health',
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

class GetOrgDataCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? geoCode = '4819012',
    List<String>? codesList,
  }) async {
    final codes = _serializeList(codesList);

    return ApiManager.instance.makeApiCall(
      callName: 'GetOrgData',
      apiUrl: '${NavigiServiceGroup.baseUrl}/listings/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
        'geoCode': geoCode,
        'codes': codes,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? orgName(dynamic response) => (getJsonField(
        response,
        r'''$.organizations[:].orgName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.organizations[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? hoursOperation(dynamic response) => (getJsonField(
        response,
        r'''$.organizations[:].daysTime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? phoneNumber(dynamic response) => (getJsonField(
        response,
        r'''$.organizations[:].contactPhone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? latitude(dynamic response) => (getJsonField(
        response,
        r'''$.organizations[:].latitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? longitude(dynamic response) => (getJsonField(
        response,
        r'''$.organizations[:].longitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<String>? progNameEN(dynamic response) => (getJsonField(
        response,
        r'''$.organizations[:].codes[:].nameEn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? progNameFR(dynamic response) => (getJsonField(
        response,
        r'''$.organizations[:].codes[:].nameFr''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? orgId(dynamic response) => getJsonField(
        response,
        r'''$.organizations''',
        true,
      ) as List?;
}

class GetOrganizationByIdCall {
  Future<ApiCallResponse> call({
    String? orgId = 'AD_HS_00645ea3-3057-4495-a893-7a1d5df720c5',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetOrganizationById',
      apiUrl: '${NavigiServiceGroup.baseUrl}listings/search/organization',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'orgId': orgId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProgramByIdCall {
  Future<ApiCallResponse> call({
    String? progId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetProgramById',
      apiUrl: '${NavigiServiceGroup.baseUrl}listings/search/program',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'progId': progId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCategoriesCall {
  Future<ApiCallResponse> call({
    int? categoryId = 2,
    int? locality = 4819012,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCategories',
      apiUrl:
          '${NavigiServiceGroup.baseUrl}listings/search/category-organizations',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'categoryId': categoryId,
        'locality': locality,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? categoryResults(dynamic response) => getJsonField(
        response,
        r'''$[0][*]''',
        true,
      ) as List?;
}

class GetRegionByNameCall {
  Future<ApiCallResponse> call({
    String? nameQuery = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetRegionByName',
      apiUrl: '${NavigiServiceGroup.baseUrl}/location/region/name',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'nameQuery': nameQuery,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRegionByGeoCodeCall {
  Future<ApiCallResponse> call({
    String? geoCode = '4819012',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetRegionByGeoCode',
      apiUrl: '${NavigiServiceGroup.baseUrl}/location/region/geoCode',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'geoCode': geoCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllListingsByRegionCall {
  Future<ApiCallResponse> call({
    String? geoCode = '4819012',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllListingsByRegion',
      apiUrl: '${NavigiServiceGroup.baseUrl}/location/region/listings',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'geoCode': geoCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End navigi-service Group Code

class GetAllOrgsInCategoryCopyCall {
  static Future<ApiCallResponse> call({
    int? catId = 2,
    double? locality,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllOrgsInCategory Copy',
      apiUrl:
          'https://stage-navigi-service.helpseeker.org/listings/search/category-organizations',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'categoryId': catId,
        'locality': locality,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? categoryListItem(dynamic response) => getJsonField(
        response,
        r'''$[0][*]''',
        true,
      ) as List?;
  static List? coordinates(dynamic response) => getJsonField(
        response,
        r'''$[:][:].latlng''',
        true,
      ) as List?;
  static List<double>? lats(dynamic response) => (getJsonField(
        response,
        r'''$[:][:].latitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? longs(dynamic response) => (getJsonField(
        response,
        r'''$[:][:].longitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class GetOrgsInLocalityAndCategoryCall {
  static Future<ApiCallResponse> call({
    int? catId = 2,
    String? locality = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getOrgsInLocalityAndCategory',
      apiUrl:
          'https://stage-navigi-service.helpseeker.org/listings/search/category-organizations',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'categoryId': catId,
        'locality': locality,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? categoryListItem(dynamic response) => getJsonField(
        response,
        r'''$[0][*]''',
        true,
      ) as List?;
  static List? coordinates(dynamic response) => getJsonField(
        response,
        r'''$[:][:].latlng''',
        true,
      ) as List?;
  static List<double>? lats(dynamic response) => (getJsonField(
        response,
        r'''$[:][:].latitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? longs(dynamic response) => (getJsonField(
        response,
        r'''$[:][:].longitude''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class SearchCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? geoCode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'search',
      apiUrl: 'https://stage-navigi-service.helpseeker.org/listings/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
        'geoCode': geoCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? programsorganizations(dynamic response) => getJsonField(
        response,
        r'''$.programs[:].organization''',
        true,
      ) as List?;
  static List? organizations(dynamic response) => getJsonField(
        response,
        r'''$.organizations''',
        true,
      ) as List?;
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
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
