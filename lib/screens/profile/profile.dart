import 'package:flutter/material.dart';
import 'package:studentapp_provider/core/constants.dart';
import 'package:studentapp_provider/model/modelstudent.dart';
import 'package:studentapp_provider/screens/widgets/circle_image_widget.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.model,
  });

  final Student model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: kWhite,
      title: CircleImageWidget(radius: 70, image: model.image),
      content: SizedBox(
        height: size.height * 0.15,
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                const Text('Name   :'),
                Text(
                  model.name,
                  style: textStyle,
                )
              ],
            ),
            kheight10,
            Row(
              children: [
                const Text('Age       :'),
                kwidth20,
                Text(
                  model.age,
                  style: textStyle,
                )
              ],
            ),
            kheight10,
            Row(
              children: [
                const Text('Phone   :'),
                kwidth20,
                Text(
                  model.phone,
                  style: textStyle,
                )
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
