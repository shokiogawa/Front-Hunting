import 'package:demo_flutter_project/models/db/database.dart';
import 'package:demo_flutter_project/models/db/dao_query.dart';
import 'package:moor/moor.dart';

class CategoryRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 100)();

  RealColumn get experience => real()();
}

class StretchRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get movieUrl => text()();

  TextColumn get path => text()();

  IntColumn get subCategoryId =>
      integer().customConstraint('NOT NULL REFERENCES sub_category_records(id)')();
}


class TagRecords extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class StretchAndTagRecords extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get stretchId =>
      integer().customConstraint('NOT NULL REFERENCES stretch_records(id)')();
  IntColumn get tagId =>
      integer().customConstraint('NOT NULL REFERENCES tag_records(id)')();
}

// class MainAndSubCategory {
//   final CategoryRecord categoryRecord;
//   final SubCategoryRecord subCategoryRecord;
//
//   MainAndSubCategory(this.categoryRecord, this.subCategoryRecord);
// }

// @UseDao(tables: [
//   CategoryRecords,
//   SubCategoryRecords,
//   StretchRecords,
//   TagRecords,
//   StretchAndTagRecords
// ], include: {
//   'query.moor'
// })


//クエリ例
// Future<List<AllMainAndSubCategoryResult>> getAllMainAndSub() async {
//   return await allMainAndSubCategory().get();
// }
//
// Future<List<TagRecord>> getStretch() async{
//   return select(tagRecords).get();
// }
//
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
//
// Future<void> addAllCategory() async {
//   await batch((batch) {
//     batch.insertAll(categoryRecords, [
//       CategoryRecordsCompanion(name: Value("ストレッチ系"), experience: Value(0.0)),
//       CategoryRecordsCompanion(name: Value("有酸素系"), experience: Value(0.0)),
//       CategoryRecordsCompanion(
//           name: Value("筋肉トレーニング系"), experience: Value(0.0)),
//       CategoryRecordsCompanion(name: Value("ダンス系"), experience: Value(0.0)),
//     ]);
//   });
// }
//
// Future<void> addAllSubCategory() async {
//   await batch((batch) {
//     batch.insertAll(subCategoryRecords, [
//       SubCategoryRecordsCompanion.insert(
//           name: "ストレッチ系1", level: 1, nowLevel: true, categoryId: 1),
//       SubCategoryRecordsCompanion.insert(
//           name: "ストレッチ系2", level: 2, nowLevel: false, categoryId: 1),
//       SubCategoryRecordsCompanion.insert(
//           name: "ストレッチ系3", level: 3, nowLevel: false, categoryId: 1),
//       SubCategoryRecordsCompanion.insert(
//           name: "有酸素系1", level: 1, nowLevel: true, categoryId: 2),
//       SubCategoryRecordsCompanion.insert(
//           name: "有酸素系2", level: 2, nowLevel: false, categoryId: 2),
//       SubCategoryRecordsCompanion.insert(
//           name: "有酸素系3", level: 3, nowLevel: false, categoryId: 2),
//       SubCategoryRecordsCompanion.insert(
//           name: "筋肉トレーニング系1", level: 1, nowLevel: true, categoryId: 3),
//       SubCategoryRecordsCompanion.insert(
//           name: "筋肉トレーニング系2", level: 2, nowLevel: false, categoryId: 3),
//       SubCategoryRecordsCompanion.insert(
//           name: "筋肉トレーニング系3", level: 3, nowLevel: false, categoryId: 3),
//       SubCategoryRecordsCompanion.insert(
//           name: "ダンス系1", level: 1, nowLevel: true, categoryId: 4),
//       SubCategoryRecordsCompanion.insert(
//           name: "ダンス系2", level: 2, nowLevel: false, categoryId: 4),
//       SubCategoryRecordsCompanion.insert(
//           name: "ダンス系3", level: 3, nowLevel: false, categoryId: 4),
//     ]);
//   });
// }
//
// Future<void> addAllStretch() async {
//   await batch((batch) {
//     batch.insertAll(stretchRecords, [
//       StretchRecordsCompanion.insert(
//           name: "ストレッチ系のストレッチ1",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 1),
//       StretchRecordsCompanion.insert(
//           name: "ストレッチ系のストレッチ2",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 2),
//       StretchRecordsCompanion.insert(
//           name: "ストレッチ系のストレッチ3",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 3),
//       StretchRecordsCompanion.insert(
//           name: "有酸素系のストレッチ1",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 4),
//       StretchRecordsCompanion.insert(
//           name: "有酸素系のストレッチ2",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 5),
//       StretchRecordsCompanion.insert(
//           name: "有酸素系のストレッチ3",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 6),
//       StretchRecordsCompanion.insert(
//           name: "筋肉トレーニング系のストレッチ1",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 7),
//       StretchRecordsCompanion.insert(
//           name: "筋肉トレーニング系のストレッチ2",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 8),
//       StretchRecordsCompanion.insert(
//           name: "筋肉トレーニング系のストレッチ3",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 9),
//       StretchRecordsCompanion.insert(
//           name: "ダンス系のストレッチ1",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 10),
//       StretchRecordsCompanion.insert(
//           name: "ダンス系のストレッチ2",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 11),
//       StretchRecordsCompanion.insert(
//           name: "ダンス系のストレッチ3",
//           movieUrl: 'https:movie_url.com',
//           path: "path",
//           subCategoryId: 12),
//     ]);
//   });
// }
//
// Future<void> addAllTag() async {
//   await batch((batch) {
//     batch.insertAll(tagRecords, [
//       TagRecordsCompanion.insert(name: "眠い"),
//       TagRecordsCompanion.insert(name: "寝起き"),
//       TagRecordsCompanion.insert(name: "脳がまとまらない"),
//       TagRecordsCompanion.insert(name: "活発な気分"),
//       TagRecordsCompanion.insert(name: "体が硬い"),
//       TagRecordsCompanion.insert(name: "集中力がない"),
//     ]);
//   });
// }
//
// Future<void> addAllStretchAndTag() async{
//   await batch((batch){
//     batch.insertAll(stretchAndTagRecords, [
//       StretchAndTagRecordsCompanion.insert(stretchId: 1, tagId: 1),
//       StretchAndTagRecordsCompanion.insert(stretchId: 1, tagId: 2),
//       StretchAndTagRecordsCompanion.insert(stretchId: 1, tagId: 3),
//       StretchAndTagRecordsCompanion.insert(stretchId: 2, tagId: 1),
//       StretchAndTagRecordsCompanion.insert(stretchId: 2, tagId: 2),
//       StretchAndTagRecordsCompanion.insert(stretchId: 2, tagId: 3),
//       StretchAndTagRecordsCompanion.insert(stretchId: 3, tagId: 1),
//       StretchAndTagRecordsCompanion.insert(stretchId: 3, tagId: 2),
//       StretchAndTagRecordsCompanion.insert(stretchId: 3, tagId: 3),
//       StretchAndTagRecordsCompanion.insert(stretchId: 4, tagId: 3),
//       StretchAndTagRecordsCompanion.insert(stretchId: 4, tagId: 4),
//       StretchAndTagRecordsCompanion.insert(stretchId: 4, tagId: 6),
//       StretchAndTagRecordsCompanion.insert(stretchId: 5, tagId: 3),
//       StretchAndTagRecordsCompanion.insert(stretchId: 5, tagId: 4),
//       StretchAndTagRecordsCompanion.insert(stretchId: 5, tagId: 6),
//       StretchAndTagRecordsCompanion.insert(stretchId: 6, tagId: 3),
//       StretchAndTagRecordsCompanion.insert(stretchId: 6, tagId: 4),
//       StretchAndTagRecordsCompanion.insert(stretchId: 6, tagId: 6),
//       StretchAndTagRecordsCompanion.insert(stretchId: 7, tagId: 4),
//       StretchAndTagRecordsCompanion.insert(stretchId: 7, tagId: 6),
//       StretchAndTagRecordsCompanion.insert(stretchId: 8, tagId: 4),
//       StretchAndTagRecordsCompanion.insert(stretchId: 8, tagId: 6),
//       StretchAndTagRecordsCompanion.insert(stretchId: 9, tagId: 4),
//       StretchAndTagRecordsCompanion.insert(stretchId: 9, tagId: 6),
//       StretchAndTagRecordsCompanion.insert(stretchId: 10, tagId: 3),
//       StretchAndTagRecordsCompanion.insert(stretchId: 10, tagId: 4),
//       StretchAndTagRecordsCompanion.insert(stretchId: 10, tagId: 6),
//       StretchAndTagRecordsCompanion.insert(stretchId: 11, tagId: 3),
//       StretchAndTagRecordsCompanion.insert(stretchId: 11, tagId: 4),
//       StretchAndTagRecordsCompanion.insert(stretchId: 11, tagId: 6),
//       StretchAndTagRecordsCompanion.insert(stretchId: 12, tagId: 3),
//       StretchAndTagRecordsCompanion.insert(stretchId: 12, tagId: 4),
//       StretchAndTagRecordsCompanion.insert(stretchId: 12, tagId: 6),
//     ]);
//   });
// }
//
// Future<void> seedData() async {
//   transaction(() async {
//     await addAllCategory();
//     await addAllSubCategory();
//     await addAllStretch();
//     await addAllTag();
//     await addAllStretchAndTag();
//   });
// }
//
// Future<int> addSubCategory() {
//   return into(subCategoryRecords).insert(SubCategoryRecordsCompanion(
//       name: Value("体感レベル1"),
//       level: Value(1),
//       nowLevel: Value(true),
//       categoryId: Value(1)));
// }
//
// Future<List<CategoryRecord>> getCategory() async {
//   return select(categoryRecords).get();
// }

