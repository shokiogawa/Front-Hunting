

import 'package:demo_flutter_project/models/entity/company.dart';
import 'package:moor/moor.dart';

class CompanyRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 100)();

  TextColumn get detail => text().withLength(max: 1000)();

  IntColumn get status => intEnum<CompanyStatus>()();
}