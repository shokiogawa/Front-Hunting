import 'package:demo_flutter_project/models/entity/company.dart';
import 'package:flutter/material.dart';

class CompanyTileComponent extends StatelessWidget {
  final Company company;

  CompanyTileComponent({required this.company});

  @override
  Widget build(BuildContext context) {
    final companyStatus = statusList.where((cs) => cs.companyStatus == company.companyStatus).first;
    return ListTile(
      title: Text(company.name),
      subtitle: Text("選考状況:  " + companyStatus.statusJp),
      leading: Icon(Icons.business_sharp),
    );
  }
}
