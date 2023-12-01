import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_provider/functions/provider/student_provider.dart';
import 'package:studentapp_provider/screens/home/widgets/list_student_tile.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({Key? key});

  @override
  Widget build(BuildContext context) {
    context.read<StudentProvider>().getStudents('');
    return Consumer<StudentProvider>(
      builder: (BuildContext context, StudentProvider value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.studentList.length,
          itemBuilder: (context, index) {
            return ListStudentTile(
              model: value.studentList[index],
            );
          },
        );
      },
    );
  }
}
