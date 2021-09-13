import 'package:flutter/material.dart';

enum CompanyStatus {
  Explanation,
  FirstInterview,
  SecondInterview,
  ThirdInterview,
  FinalInterview,
  Hunted,
}

@immutable
class Company {
  final int? id;
  final String name;
  final String detail;
  final CompanyStatus companyStatus;

  Company(this.id, this.name, this.detail, this.companyStatus);

  Company copyWith({
    int? id,
    String? name,
    String? detail,
    CompanyStatus? companyStatus,
  }) =>
      Company(id ?? this.id, name ?? this.name, detail ?? this.detail,
          companyStatus ?? this.companyStatus);
}

class CompanyStatusJp {
  final CompanyStatus companyStatus;
  final String statusJp;

  const CompanyStatusJp(this.companyStatus, this.statusJp);
}

const List<CompanyStatusJp> statusList = [
  CompanyStatusJp(CompanyStatus.Explanation, "説明会"),
  CompanyStatusJp(CompanyStatus.FirstInterview, "1次面接"),
  CompanyStatusJp(CompanyStatus.SecondInterview, "2次面接"),
  CompanyStatusJp(CompanyStatus.ThirdInterview, "3次面接"),
  CompanyStatusJp(CompanyStatus.FinalInterview, "最終面接"),
  CompanyStatusJp(CompanyStatus.Hunted, "内定済み")
];
