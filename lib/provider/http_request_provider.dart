import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_exam_app/api/api.dart';
import 'package:online_exam_app/model/result.dart';
import 'package:online_exam_app/model/subject.dart';

class HttpRequestProvider {
  ///Subjects Queries

  ///Gets All Subjects from the server
  Future<List<Subject>> getSubjects() async {
    List<Subject> _fetchedSubjects = [];
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

  ///Gets my results.....
  ///

  // Future<List<Result>> getStudentsResults({@required studentId}) async {
  //   List<Result> _fetchedResults = [];

  //   try {
  //     final http.Response response =
  //         await http.get(api + 'results/' + studentId.toString());

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       print(data['results']['ranks']);
  //       // data['results']['ranks'].foreach((resultData) {
  //       //   final _result = Result.fromMap(resultData);
  //       //   _fetchedResults.add(_result);
  //       // });

  //     }
  //   } catch (e) {
  //     print(e);
  //   }

  //   return _fetchedResults;
  // }

  ///Gets All Subjects from the server
  Future<List<Result>> getStudentsResults({@required int studentId}) async {
    List<Result> _fetchedResults = [];
    try {
      final http.Response response =
          await http.get(api + 'results/' + studentId.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        data['results']["ranks"].forEach((resData) {
          final _result = Result.fromMap(resData);

          _fetchedResults.add(_result);
        });
      }
    } catch (e) {
      print(e);
    }
    return _fetchedResults;
  }
}
