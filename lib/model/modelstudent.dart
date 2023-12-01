import 'package:hive/hive.dart';

part 'modelstudent.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String age;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String? image;
  @HiveField(5)
  String department;

  Student(
      {required this.age,
      required this.name,
      required this.phone,
      this.image,
      required this.id,
      required this.department});
}
