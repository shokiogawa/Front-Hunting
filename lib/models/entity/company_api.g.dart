// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyApiList _$CompanyApiListFromJson(Map<String, dynamic> json) {
  return CompanyApiList(
    (json['results'] as List<dynamic>)
        .map((e) => CompanyApi.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CompanyApiListToJson(CompanyApiList instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

CompanyApi _$CompanyApiFromJson(Map<String, dynamic> json) {
  return CompanyApi(
    json['name'] as String?,
    json['prText'] as String?,
    json['reMarks'] as String?,
    json['logoImgUrlSp'] as String?,
  );
}

Map<String, dynamic> _$CompanyApiToJson(CompanyApi instance) =>
    <String, dynamic>{
      'name': instance.name,
      'prText': instance.prText,
      'reMarks': instance.reMarks,
      'logoImgUrlSp': instance.logoImgUrlSp,
    };
