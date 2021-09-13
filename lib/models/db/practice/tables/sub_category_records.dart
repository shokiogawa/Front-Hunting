import 'package:demo_flutter_project/models/db/database.dart';
import 'package:moor/moor.dart';


class SubCategoryRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(max: 100)();

  IntColumn get level => integer()();

  BoolColumn get nowLevel => boolean()();

  IntColumn get categoryId =>
      integer().customConstraint('NOT NULL REFERENCES category_records(id)')();
}


