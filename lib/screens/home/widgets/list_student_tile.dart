import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_provider/functions/provider/student_provider.dart';
import 'package:studentapp_provider/model/modelstudent.dart';
import 'package:studentapp_provider/screens/add_edit/add_student.dart';
import 'package:studentapp_provider/screens/profile/profile.dart';
import 'package:studentapp_provider/screens/widgets/circle_image_widget.dart';

class ListStudentTile extends StatelessWidget {
  final Student model;

  const ListStudentTile({
    Key? key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileTile(model: model)));
      },
      leading: CircleImageWidget(
        radius: 20,
        image: model.image,
      ),
      title: Text(model.name),
      subtitle: Text(model.department),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddEditScreen(model: model, action: ActionType.edit),
                ),
              );
              setData(model);
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () async {
              await Provider.of<StudentProvider>(context, listen: false)
                  .deleteModel(model.id!);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
