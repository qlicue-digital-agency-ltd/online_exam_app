import 'package:flutter/material.dart';
import 'package:online_exam_app/model/answer.dart';
import 'package:online_exam_app/model/examination.dart';
import 'package:online_exam_app/model/question.dart';
import 'package:online_exam_app/model/result.dart';
import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/provider/http_request_provider.dart';
import 'package:scoped_model/scoped_model.dart';

mixin ConnectedExamModel on Model {
  HttpRequestProvider _httpRequestProvider = HttpRequestProvider();
  List<Subject> _availableSubjectList = [];

  List<Subject> get availableSubjects => _availableSubjectList;
}
mixin UtilityModel on ConnectedExamModel {}
mixin LoginModel on ConnectedExamModel {}

mixin SubjectModel on ConnectedExamModel {
  initializeSubjects() {
    _httpRequestProvider.getSubjects().then((subjectList) {
      _availableSubjectList = subjectList;
      notifyListeners();
    });
  }

  Subject getSubjectById({@required subjectId}) {
    Subject _subject;
    try {
      _availableSubjectList.firstWhere((subject) => subject.id == subjectId);
    } catch (e) {
      print(e);
    }

    return _subject;
  }
}
mixin ExamModel on ConnectedExamModel {
  ///list of examinations
  List<Examination> _avaibleExaminations = [];

  ///list of Questions of a particular exam
  List<Question> _avaibleQuestions = [];

  ///list of answers of a particular question
  List<Answer> _avaibleAnswers = [];

  ///list of results of a particular student
  List<Result> _avaibleResults = [];

  ///current question
  Question _currentQuestion;

  ///getter for the current question
  Question get currentQuestion => _currentQuestion;

  ///gtter List of examinations
  List<Examination> get avaibleExaminations => _avaibleExaminations;

  ///getter of list of Questions of a particular exam
  List<Question> get avaibleQuestions => _avaibleQuestions;

  ///getter of list of answers of a particular question
  List<Answer> get avaibleAnswers => _avaibleAnswers;

  ///getter of list of results of a particular student
  List<Result> get avaibleResults => _avaibleResults;

  set setQuestion(questionId) {
    Question _question;
    try {
      _question =
          _avaibleQuestions.firstWhere((question) => question.id == questionId);
      _avaibleAnswers = _question.answers;
    } catch (e) {
      print(e);
    }
    _currentQuestion = _question;
    notifyListeners();
  }

  set setPreferredAnswer(id) {
    // bool _status = !_answerList.firstWhere((race) => race.id == id).isSelected;
    // _answerList.forEach((answer) {
    //   if (answer.id == id) {
    //     answer.isSelected = _status;
    //   } else {
    //     answer.isSelected = false;
    //   }
    // });
    // notifyListeners();
  }
}
