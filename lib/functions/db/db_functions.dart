import 'package:hive/hive.dart';
import 'package:studentapp_provider/model/modelstudent.dart';

class HiveDb {
  final String dbName = 'student';

  Future<bool> insertInToDb(Student model) async {
    try {
      final db = await Hive.openBox<Student>(dbName);
      model.id = DateTime.now().day +
          DateTime.now().hour +
          DateTime.now().minute +
          DateTime.now().microsecond;
      await db.put(model.id, model);
      print("adderdddd");
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<List<Student>> getData() async {
    final db = await Hive.openBox<Student>(dbName);
    final list = <Student>[];
    for (var i in db.values) {
      list.add(i);
    }
    return list;
  }

  Future<bool> updateTable(Student model) async {
    try {
      final db = await Hive.openBox<Student>(dbName);
      db.put(model.id!, model);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<void> deleteData(int id) async {
    final db = await Hive.openBox<Student>(dbName);
    db.delete(id);
  }
}
