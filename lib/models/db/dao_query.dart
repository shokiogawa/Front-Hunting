import 'package:demo_flutter_project/models/db/database.dart';
import 'package:demo_flutter_project/models/db/practice/tables/category_records.dart';
import 'package:demo_flutter_project/models/db/practice/tables/sub_category_records.dart';
import 'package:demo_flutter_project/models/db/tables.dart';
import 'package:demo_flutter_project/models/entity/company.dart';
import 'package:moor/moor.dart';

part 'dao_query.g.dart';

@UseDao(tables: [CompanyRecords])
class DaoQuery extends DatabaseAccessor<MyDatabase> with _$DaoQueryMixin {
  DaoQuery(MyDatabase db) : super(db);

  Future<int> addCompanyRecords(Company company) async {
    try {
      print("dbへ保存");
      return into(companyRecords).insert(CompanyRecordsCompanion(
          name: Value(company.name),
          detail: Value(company.detail),
          status: Value(company.companyStatus)));
    } catch (error) {
      print(error);
      throw Future.error(error);
    }
  }

  Future<List<Company>> getCompanyList() async {
    try {
      final List<CompanyRecord> companyRecord =
          await select(companyRecords).get();
      final List<Company> companyList = [];
      for (var company in companyRecord) {
        companyList.add(
            Company(company.id, company.name, company.detail, company.status));
      }
      return companyList;
    } catch (error) {
      throw Future.error(error);
    }
  }

  Future<int> updateCompany(Company company) async {
    try {
      final id = company.id;
      final query = update(companyRecords)
        ..where((company) => company.id.equals(id));
      final CompanyRecordsCompanion companyRecordsCompanion =
          CompanyRecordsCompanion(status: Value(company.companyStatus));
      return query.write(companyRecordsCompanion);
    } catch (error) {
      throw Future.error(error);
    }
  }

// Future<List<MainAndSubCategory>> getAllMainAndSubCategory() async {
//   final query = select(subCategoryRecords).join([
//     innerJoin(categoryRecords,
//         categoryRecords.id.equalsExp(subCategoryRecords.categoryId))
//   ])
//     ..where(subCategoryRecords.nowLevel.equals(true));
//
//   final typedResult = await query.get();
//   // final typedResult = query.where(subCategoryRecords.nowLevel.equals(true));
//   final List<MainAndSubCategory> categoryList = [];
//   for (var result in typedResult) {
//     categoryList.add(MainAndSubCategory(result.readTable(categoryRecords),
//         result.readTable(subCategoryRecords)));
//   }
//   return categoryList;
// }
}
