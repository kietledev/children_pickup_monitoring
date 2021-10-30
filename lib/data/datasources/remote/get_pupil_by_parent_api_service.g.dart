// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pupil_by_parent_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GetPupilByParentApiService implements GetPupilByParentApiService {
  _GetPupilByParentApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://dtuct.ddns.net:9999/api/getListPupilByParentId';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<ResponseModel>> getPupils({query, k, dm, tk, ttl}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{
      r'k': k,
      r'dm': dm,
      r'tk': tk,
      r'ttl': ttl
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<ResponseModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
