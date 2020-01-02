import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:online_exam_app/constants/enums.dart';
import 'package:online_exam_app/model/answer.dart';
import 'package:online_exam_app/model/examination.dart';
import 'package:online_exam_app/model/question.dart';
import 'package:online_exam_app/model/result.dart';
import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/provider/http_request_provider.dart';
import 'package:online_exam_app/shared/shared_peference.dart';
import 'package:scoped_model/scoped_model.dart';

mixin ConnectedExamModel on Model {
  HttpRequestProvider _httpRequestProvider = HttpRequestProvider();

  /// Shared preference DB
  SharedPref _sharedPref = SharedPref();
  List<Subject> _availableSubjectList = [];

  List<Subject> get availableSubjects => _availableSubjectList;
}
mixin UtilityModel on ConnectedExamModel {
  Country _selectedCountry = Country.TZ;
  bool _isNewToApp = true;
  bool get isNewToApp {
    _sharedPref.readBoolean('isNewToApp').then((status) {
      _isNewToApp = status;
    });

    return _isNewToApp;
  }

  Country get selectedCountry => _selectedCountry;

  set setIsNewToAppStatus(bool status) {
    _isNewToApp = status;
    _sharedPref.saveBoolean('isNewToApp', status);
    notifyListeners();
  }

  set setSelectedCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }
  
}
mixin LoginModel on ConnectedExamModel {}

mixin SubjectModel on ConnectedExamModel {
  initializeSubjects() {
    _httpRequestProvider.getSubjects().then((subjectList) {
      _availableSubjectList = subjectList;
      notifyListeners();
    });
  }

  String getSubjectAvatar({@required String code}) {
    String _avatar;
    switch (code) {
      case 'AR':
        _avatar = 'assets/icon/abacus.png';
        break;
      case 'MT':
        _avatar = 'assets/icon/calculator.png';
        break;
      case 'ENG':
        _avatar = 'assets/icon/books.png';
        break;
      case 'SCI':
        _avatar = 'assets/icon/chemistry.png';
        break;
      case 'SW':
        _avatar = 'assets/icon/book.png';
        break;
      default:
        _avatar = 'assets/icon/bookshow.png';
    }
    return _avatar;
  }

  Subject getSubjectById({@required int subjectId}) {
    Subject _subject;
    try {
      _subject = _availableSubjectList
          .firstWhere((subject) => subject.id == subjectId);
    } catch (e) {
      print(e);
    }
    print(_subject);
    return _subject;
  }
}
mixin ExamModel on ConnectedExamModel {
  ///list of examinations
  List<Examination> _availableExaminations = [];

  ///list of Questions of a particular exam
  List<Question> _availableQuestions = [];

  ///list of answers of a particular question
  List<Answer> _availableAnswers = [];

  ///current question
  Question _currentQuestion;

  ///current Examination
  Examination _currentExamination;

  ///getter for the current question
  Question get currentQuestion => _currentQuestion;

  ///getter for the current examination
  Examination get currentExamination => _currentExamination;

  ///gtter List of examinations
  List<Examination> get availableExaminations => _availableExaminations;

  ///getter of list of Questions of a particular exam
  List<Question> get availableQuestions => _availableQuestions;

  ///getter of list of answers of a particular question
  List<Answer> get availableAnswers => _availableAnswers;

  ///Get examination by ID
  Examination getExaminationById({@required int examId}) {
    Examination _examination;
    try {
      _examination = _availableExaminations
          .firstWhere((examination) => examination.id == examId);
    } catch (e) {
      print(e);
    }
    return _examination;
  }

  ///setters
  set setAvailableExamination(int subjectId) {
    _availableExaminations = _availableSubjectList
        .firstWhere((subject) => subject.id == subjectId)
        .examinations;
    _currentExamination = _availableExaminations.first;
    notifyListeners();
  }

  set setAvailableQuestions(int examinationId) {
    _availableQuestions = _availableExaminations
        .firstWhere((examination) => examination.id == examinationId)
        .questions;
    _currentQuestion = _availableQuestions.first;
    _availableAnswers = _availableQuestions.first.answers;
    notifyListeners();
  }

  set setQuestion(int questionId) {
    Question _question;
    try {
      _question = _availableQuestions
          .firstWhere((question) => question.id == questionId);
      _availableAnswers = _question.answers;
    } catch (e) {
      print(e);
    }
    _currentQuestion = _question;
    notifyListeners();
  }

  void nextQuestion() {
    print('Next Question');
    if (_currentQuestion.id != _availableQuestions.last.id) {
      int index = _availableQuestions
          .indexWhere((question) => question.id == _currentQuestion.id);

      final _question = _availableQuestions[index + 1];

      if (_question != null) setQuestion = _question.id;
    } else {
      chageExamStatus(ExamStatus.DONE);
    }
  }

  void chageExamStatus(ExamStatus status) {
    _availableExaminations.first.examStatus = status;
    notifyListeners();
  }

  void previousQuestion() {
    print('Previous Question');
    int index = _availableQuestions
        .indexWhere((question) => question.id == _currentQuestion.id);

    if (index != 0) {
      final _question = _availableQuestions[index - 1];

      if (_question != null) setQuestion = _question.id;
    }
  }

  set setPreferredAnswer(int answerId) {
    bool _status = !_availableAnswers
        .firstWhere((answer) => answer.id == answerId)
        .isSelected;
    _availableAnswers.forEach((answer) {
      if (answer.id == answerId) {
        answer.isSelected = _status;
      } else {
        answer.isSelected = false;
      }
    });
    notifyListeners();
  }
}

mixin ResultModel on ConnectedExamModel {
  ///list of results of a particular student
  List<Result> _availableResults = [];

  ///list of top 10 students per subject
  List<Result> _availableTopTen = [];

  ///getter of list of results of a particular student
  List<Result> get availableResults => _availableResults;

  ///getter of top 10 students per subject
  List<Result> get availableTopTen => _availableTopTen;

  ///fetch Results from server
  ///
  fetchStudentsResults() {
    _httpRequestProvider.getStudentsResults(studentId: 1).then((resultsList) {
      _availableResults = resultsList;
      notifyListeners();
    });
  }

  ///fetch Top 10 Student per exam
  ///
  fetchTopTenStudents({@required int examId}) {
    _httpRequestProvider
        .getTopTenPerSubject(examId: examId)
        .then((resultsList) {
      _availableTopTen = resultsList;
      print(_availableTopTen);
      notifyListeners();
    });
  }
}
