import 'dart:io';

import 'package:demo_flutter_project/models/db/practice/tables/category_records.dart';
import 'package:demo_flutter_project/models/db/dao_query.dart';
import 'package:demo_flutter_project/models/db/practice/tables/sub_category_records.dart';
import 'package:demo_flutter_project/models/db/tables.dart';
import 'package:demo_flutter_project/models/entity/company.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;


part 'database.g.dart';

@UseMoor(tables: [CompanyRecords], daos: [DaoQuery])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  //データベース追加、カラム追加などあればこの番号を＋１させていく。
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
          //一番初めにアプリを明け、データベースにアクセスするタイミングで呼ばれる。
      onCreate: (detail) {
        return detail.createAll();
      },
      onUpgrade: (m,f,t) async{
      },
          //毎回アプリを明けデータベースにアクセスするタイミングで呼ばれる。
      beforeOpen: (details) async {
        //データベースが作成されたのが今sessionの場合呼ばれる。
        if (details.wasCreated) {
        }
        await customStatement('PRAGMA foreign_key = ON');
      });
}

LazyDatabase _openConnection() {
  print("DBオープン");
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
