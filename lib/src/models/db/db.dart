import 'dart:io';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';

@DataClassName("Category")
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get category => text()();

  TextColumn get memo => text().withLength(min: 1, max: 38)();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Categories])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Category>> get allCategories => select(categories).get();


}
