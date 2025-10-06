import 'package:flutter/material.dart';
import '../models/school_class.dart';
import 'student_list_screen.dart';

class ClassListScreen extends StatelessWidget {
  const ClassListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados de exemplo
    final List<SchoolClass> classes = [
      SchoolClass(name: 'Turma A', students: [
        Student(name: 'João Silva'),
        Student(name: 'Maria Santos'),
        Student(name: 'Pedro Costa'),
        Student(name: 'Ana Oliveira'),
        Student(name: 'Carlos Martins'),
      ]),
      SchoolClass(name: 'Turma B', students: [
        Student(name: 'Sofia Ferreira'),
        Student(name: 'Miguel Rodrigues'),
        Student(name: 'Catarina Almeida'),
        Student(name: 'André Sousa'),
        Student(name: 'Inês Gonçalves'),
      ]),
      SchoolClass(name: 'Turma C', students: [
        Student(name: 'Ricardo Pereira'),
        Student(name: 'Beatriz Ribeiro'),
        Student(name: 'Tiago Lopes'),
        Student(name: 'Daniela Fernandes'),
        Student(name: 'Luís Nogueira'),
      ]),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Turmas'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          final schoolClass = classes[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(schoolClass.name),
              subtitle: Text('${schoolClass.students.length} alunos'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StudentListScreen(schoolClass: schoolClass),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
