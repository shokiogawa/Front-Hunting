import 'package:json_annotation/json_annotation.dart';
part 'company_api.g.dart';

@JsonSerializable()
class CompanyApiList {
  final List<CompanyApi> results;

  CompanyApiList(this.results);

  factory CompanyApiList.fromJson(Map<String, dynamic> json) => _$CompanyApiListFromJson(json);
  Map<String, dynamic> toJson() =>_$CompanyApiListToJson(this);
}

@JsonSerializable()
class CompanyApi {
  final String? name;
  final String? prText;
  final String? reMarks;
  final String? logoImgUrlSp;
  CompanyApi(this.name, this.prText, this.reMarks, this.logoImgUrlSp);
  factory CompanyApi.fromJson(Map<String, dynamic> json) => _$CompanyApiFromJson(json);
  Map<String, dynamic> toJson() =>_$CompanyApiToJson(this);
}

