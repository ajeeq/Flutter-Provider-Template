import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_provider_template/Models/student_model.dart';

final courseListProvider = StateNotifierProvider<StudentListNotifier, List<StudentModel>>((ref) => StudentListNotifier());
final classNameProvider = StateNotifierProvider((ref) => ClassNameNotifier());

class ClassNameNotifier extends StateNotifier<String> {
  ClassNameNotifier(): super("");

  setClassName(String value) {
    state = value;
  }
}

class StudentListNotifier extends StateNotifier<List<StudentModel>> {
  StudentListNotifier() : super([]);

  addSelection(StudentModel sm) {
    state = [...state, sm];
  }
}
