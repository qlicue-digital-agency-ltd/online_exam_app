import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:online_exam_app/api/api.dart';
import 'package:online_exam_app/model/subject.dart';

class HttpRequestProvider {
  ///Subjects Queries

  ///Gets All Subjects from the server
  Future<List<Subject>> getSubjects() async {
    List<Subject> _fetchedSubjects =[];
    try {
      final http.Response response = await http.get(api + 'subjects');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        data['subjects'].forEach((subjectData) {
          final _subject = Subject.fromMap(subjectData);

          _fetchedSubjects.add(_subject);
        });
      }
    } catch (e) {
      print(e);
    }
    return _fetchedSubjects;
  }
}
