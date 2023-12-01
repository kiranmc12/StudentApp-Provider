import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_provider/functions/provider/student_provider.dart';
import 'package:studentapp_provider/model/modelstudent.dart';
import 'package:studentapp_provider/screens/add_edit/add_student.dart';
import 'package:studentapp_provider/screens/home/widgets/search_widget.dart';
import 'package:studentapp_provider/screens/profile/profile.dart';
import 'package:studentapp_provider/screens/widgets/circle_image_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Search Students",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: SearchFieldWidget(
                searchController: searchController,
              ),
            ),
            Expanded(
              child: ListViewHome(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddEditScreen(action: ActionType.add),
            ),
          );
        },
        label: Icon(Icons.add),
      ),
    );
  }
}

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
