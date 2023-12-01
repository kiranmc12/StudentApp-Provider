import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp_provider/functions/provider/student_provider.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
    required this.searchController,
  });
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<StudentProvider>().getStudents(value);
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 43, 43, 43),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: "Search Student",
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
      ),
    );
  }
}
