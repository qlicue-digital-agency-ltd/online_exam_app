import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_exam_app/api/api.dart';
import 'package:online_exam_app/model/grade.dart';
import 'package:online_exam_app/model/result.dart';
import 'package:online_exam_app/model/student.dart';
import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/model/user.dart';

class HttpRequestProvider {
  ///Subjects Queries

  ///Gets All Subjects from the server
  Future<List<Subject>> getSubjects({@required int gradeId}) async {
    List<Subject> _fetchedSubjects = [];
    try {
      final http.Response response =
          await http.get(api + 'subjects/' + gradeId.toString());
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

  ///Gets All Subjects from the server
  Future<List<Result>> getStudentsResults({@required int studentId}) async {
    List<Result> _fetchedResults = [];
    try {
      final http.Response response =
          await http.get(api + 'results/' + studentId.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        data['results'].forEach((resData) {
          final _result = Result.fromMap(resData);

          _fetchedResults.add(_result);
        });
      }
    } catch (e) {
      print(e);
    }
    return _fetchedResults;
  }

  ///Gets All Top Ten ranks per exam from the server
  Future<List<Result>> getTopTenPerSubject({@required int examId}) async {
    List<Result> _fetchedResults = [];
    try {
      final http.Response response =
          await http.get(api + 'ranks/' + examId.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        data['ranks'].forEach((resData) {
          final _result = Result.fromMap(resData);

          _fetchedResults.add(_result);
        });
      }
    } catch (e) {
      print(e);
    }
    return _fetchedResults;
  }

  ///signup and login user
  Future<User> authenticateUser({credentials, url}) async {
    User _user;
    Map<String, String> _headers = {"Content-Type": "application/json"};
    try {
      final http.Response response = await http.post(api + url,
          body: json.encode(credentials), headers: _headers);

      if (response.statusCode == 201 || response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        _user = User.fromMap(data);
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
    }

    return _user;
  }

  ///Gets All Grades  from the server
  Future<List<Grade>> getAllGrades() async {
    List<Grade> _fetchedGrades = [];
    try {
      final http.Response response = await http.get(api + 'grades');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        data['grades'].forEach((resData) {
          final _result = Grade.fromMap(resData);

          _fetchedGrades.add(_result);
        });
      }
    } catch (e) {
      print(e);
    }
    return _fetchedGrades;
  }

  ///Gets All Student associated with the guardian from the server
  Future<List<Student>> getStudentsAssociatedWithTheGuardian(
      {@required int userId}) async {
    List<Student> _fetchedStudents = [];
    try {
      final http.Response response =
          await http.get(api + 'students/' + userId.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        data['students'].forEach((resData) {
          final _result = Student.fromMap(resData);

          _fetchedStudents.add(_result);
        });
      }
    } catch (e) {
      print(e);
    }
    return _fetchedStudents;
  }

  // post  students.
  Future<Student> postStudent(
      {@required String name,
      @required int gradeId,
      @required int districtId,
      @required String birthday,
      @required int regionId,
      @required String gender,
      @required String schoolName,
      @required File image,
      @required int userId}) async {
    Dio dio = new Dio();
    Student _student;

    FormData formdata = new FormData();
    formdata.add("file", new UploadFileInfo(image, "image.jpeg"));
    formdata.add("name", name);
    formdata.add("grade_id", gradeId);
    formdata.add("district_id", districtId);
    formdata.add("birthday", birthday);
    formdata.add("region_id", regionId);
    formdata.add("gender", gender);
    formdata.add("school_name", schoolName);
    formdata.add("user_id", userId);

    dio
        .post(api + "student",
            data: formdata,
            options: Options(
                method: 'POST',
                responseType: ResponseType.json // or ResponseType.JSON
                ))
        .then((response) {
      //   final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> data = json.decode(response.data);

      if (response.statusCode == 201) {
        _student = Student.fromMap(data['student']);
      } else {}
    }).catchError((error) {
      print(error);
    });

    print('++++++++++++++++++++');
    print(_student);
    print('++++++++++++++++++++');
    return _student;
  }

  ///Post result...
  Future<bool> postRankResult({credentials}) async {
    bool _isSuccessful = false;
    Map<String, String> _headers = {"Content-Type": "application/json"};
    try {
      final http.Response response = await http.post(api + 'rank',
          body: json.encode(credentials), headers: _headers);

      if (response.statusCode == 201) {
        _isSuccessful = true;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
    }

    return _isSuccessful;
  }
}
