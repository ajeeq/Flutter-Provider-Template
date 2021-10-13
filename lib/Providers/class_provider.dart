import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';

import '../Models/student_model.dart';

class ClassProvider extends ChangeNotifier {
  List<StudentModel>? studentModel;
  String className = "";

  setClassName(className) {
    this.className = className;
    notifyListeners();
  }

  setStudent(student) {
    studentModel!.add(
      StudentModel(
        student['name'] ?? "",
        student['age'] ?? "",
      ),
    );
    notifyListeners();
  }

  getOneStudent(findAge) {
    StudentModel? oneStudent = studentModel!.firstWhereOrNull((student) {
      if (student.age == findAge) return true;
      return false;
    });
    notifyListeners();
    return oneStudent;
  }
}
