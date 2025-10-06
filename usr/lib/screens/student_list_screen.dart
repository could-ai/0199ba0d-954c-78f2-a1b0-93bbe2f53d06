import 'package:flutter/material.dart';
import '../models/school_class.dart';

class StudentListScreen extends StatefulWidget {
  final SchoolClass schoolClass;

  const StudentListScreen({super.key, required this.schoolClass});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    int presentCount =
        widget.schoolClass.students.where((s) => s.isPresent).length;
    int absentCount = widget.schoolClass.students.length - presentCount;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.schoolClass.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'Presentes: $presentCount',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'Ausentes: $absentCount',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.schoolClass.students.length,
        itemBuilder: (context, index) {
          final student = widget.schoolClass.students[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: CheckboxListTile(
              title: Text(student.name),
              value: student.isPresent,
              onChanged: (bool? value) {
                setState(() {
                  student.isPresent = value ?? false;
                });
              },
              activeColor: Colors.green,
              checkColor: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
