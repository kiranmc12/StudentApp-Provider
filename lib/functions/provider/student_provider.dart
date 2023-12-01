import 'package:flutter/material.dart';
import 'package:studentapp_provider/functions/db/db_functions.dart';
import 'package:studentapp_provider/model/modelstudent.dart';

class StudentProvider extends ChangeNotifier {
  HiveDb hive = HiveDb();

  List<Student> studentList = [];

  Future<void> getStudents(String name) async {
    List<Student> tempList = await hive.getData();

    studentList = tempList
        .where((model) => model.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<void> addOrEdit(Student model, bool toEdit) async {
    toEdit ? await editModel(model) : await addModel(model);
  }

  Future<void> deleteModel(int id) async {
    await hive.deleteData(id);
    await getStudents('');
  }

  Future<void> addModel(Student model) async {
    await hive.insertInToDb(model);
    await getStudents('');
  }

  Future<void> editModel(Student model) async {
    await hive.updateTable(model);
    await getStudents('');
    print("updatedddd");
  }
}
