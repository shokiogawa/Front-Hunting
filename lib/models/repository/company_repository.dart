import 'package:demo_flutter_project/models/db/database.dart';
import 'package:demo_flutter_project/models/entity/company.dart';

abstract class CompanyRepository {
  Future<int> addCompanyRecords(Company company);

  Future<List<Company>> getCompanyList();

  Future<int> updateCompany(Company company);
}

class CompanyRepositoryImpl implements CompanyRepository {
  final MyDatabase _database;

  CompanyRepositoryImpl(this._database);

  @override
  Future<int> addCompanyRecords(Company company) async {
    return _database.daoQuery.addCompanyRecords(company);
  }

  Future<List<Company>> getCompanyList() async {
    return _database.daoQuery.getCompanyList();
  }

  Future<int> updateCompany(Company company) async {
    return _database.daoQuery.updateCompany(company);
  }
}
