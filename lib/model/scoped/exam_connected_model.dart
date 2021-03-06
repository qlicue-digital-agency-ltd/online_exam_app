import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_exam_app/constants/enums.dart';
import 'package:online_exam_app/model/answer.dart';
import 'package:online_exam_app/model/examination.dart';
import 'package:online_exam_app/model/profile.dart';
import 'package:online_exam_app/model/question.dart';
import 'package:online_exam_app/model/result.dart';
import 'package:online_exam_app/model/student.dart';
import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/provider/http_request_provider.dart';
import 'package:online_exam_app/shared/shared_peference.dart';
import 'package:rxdart/rxdart.dart' as rxSubject;
import 'package:scoped_model/scoped_model.dart';

import '../gender.dart';
import '../grade.dart';
import '../user.dart';

mixin ConnectedExamModel on Model {
  HttpRequestProvider _httpRequestProvider = HttpRequestProvider();

  /// Shared preference DB
  SharedPref _sharedPref = SharedPref();
  List<Subject> _availableSubjectList = [];
  List<Subject> _fetchedSubjectList = [];

  ///image picker
  File file;
  File _pickedImage;

  ///list of examinations
  List<Examination> _availableExaminations = [];
  List<Examination> _availablePastPapers = [];

  int _totalScore;

  List<Subject> get availableSubjects => _availableSubjectList;
  List<Examination> get availablePastPapers => _availablePastPapers;

  int get totalScore => _totalScore;

  set setTotalScore(int score) {
    _totalScore = score;
    notifyListeners();
  }

  set setPastPapers(List<Examination> exams) {
    _availablePastPapers = exams;
    notifyListeners();
  }

  Future<bool> fetchStudentSubjects({@required int gradeId}) async {
    bool _hasData = false;
    try {
      await _httpRequestProvider
          .getSubjects(gradeId: gradeId)
          .then((subjectList) {
        _fetchedSubjectList = subjectList;
        print(subjectList);
        notifyListeners();
      });
      _hasData = true;
    } catch (e) {
      print(e);
    }
    return _hasData;
  }
}
mixin UtilityModel on ConnectedExamModel {
  Country _selectedCountry = Country.TZ;
  bool _isNewToApp = true;
  bool _isFront = true;

  ///login logic
  FocusNode mobileFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController mobileEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  ///end of login

  //sign Up
  FocusNode mobileSignUpFocusNode = FocusNode();
  FocusNode passwordSignUpFocusNode = FocusNode();
  FocusNode confirmPasswordSignUpFocusNode = FocusNode();

  TextEditingController mobileSignUpEditingController = TextEditingController();
  TextEditingController passwordSignUpTextEditingController =
      TextEditingController();
  TextEditingController confirmSignUpPasswordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  //end of sigUp

  AnimationController _controllerFlipCard;

  AnimationController get controllerFlipCard => _controllerFlipCard;
  bool get isFront => _isFront;

  set animationController(AnimationController animationController) {
    _controllerFlipCard = animationController;
    notifyListeners();
  }

  set flipCard(bool status) {
    if (status)
      _controllerFlipCard.forward();
    else
      _controllerFlipCard.reverse();

    _isFront = !status;
    notifyListeners();
  }

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
mixin UserModel on ConnectedExamModel {
  ///authenicated user
  User _authenticatedUser;
  rxSubject.PublishSubject<bool> _userSubject =
      rxSubject.PublishSubject<bool>();

  ///getters
  rxSubject.PublishSubject<bool> get userSubject => _userSubject;
  User get authenticatedUser => _authenticatedUser;

  void _authenicate(User user) {
    _userSubject.add(true);
    _sharedPref.save('user', user.toMap());
    _authenticatedUser = user;
  }

  /// sign up User
  Future<bool> authenticateUser(
      {@required String phone,
      @required String password,
      @required url}) async {
    bool _isSignup = false;

    final _user = User(id: 0, phone: phone, password: password);
    await _httpRequestProvider
        .authenticateUser(credentials: _user.toMap(), url: url)
        .then((_userFromServer) {
      print(_userFromServer);
      if (_userFromServer != null) {
        _isSignup = true;
        _authenicate(_userFromServer);
      }
    });

    notifyListeners();

    return _isSignup;
  }

  ///auto authenicate
  Future<bool> autoAuthenicate() async {
    bool _isAuth = false;
    try {
      User _user = User.fromMap(await _sharedPref.read("user"));
      _authenticatedUser = _user;
      _isAuth = true;
      notifyListeners();
    } catch (Excepetion) {
      _isAuth = false;
    }
    return _isAuth;
  }

  ///logout user
  Future<void> logout() async {
    _userSubject.add(false);
    _sharedPref.remove('user');
    notifyListeners();
  }

  ///snackbar
  void showInSnackBar(
      {@required BuildContext context,
      @required GlobalKey<ScaffoldState> scaffoldKey,
      @required String title,
      @required IconData icon,
      @required Color color}) {
    FocusScope.of(context).requestFocus(FocusNode());
    scaffoldKey.currentState?.removeCurrentSnackBar();
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontSize: 16.0,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).buttonColor,
      duration: Duration(seconds: 3),
    ));
  }

  ///user profile...
  Future<Profile> postProfile({
    @required String name,
    @required String email,
    @required String gender,
    @required int userId,
  }) async {
    Profile _profile;

    await _httpRequestProvider
        .postProfile(
            image: _pickedImage,
            name: name,
            gender: gender,
            userId: userId,
            email: email)
        .then((profile) {
      if (profile != null) {
        _profile = _authenticatedUser.profile = profile;
        notifyListeners();
      }
    });
    return _profile;
  }
}

mixin SubjectModel on ConnectedExamModel {
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

  ///getter of list of Attempted Questions of a particular exam

  Map<String, int> getAttempedQuestions() {
    Map<String, int> _map;
    int _count = 0;
    int _numberOfCorrectAnswers = 0;

    _availableQuestions.forEach((question) {
      question.answers.forEach((answer) {
        if (answer.isSelected) {
          _count++;
        }

        if (answer.isSelected && answer.isCorrect) {
          _numberOfCorrectAnswers++;
        }
      });
    });

    print('++++++++++++++PPPPPPPPPPPP+++++++++++++++++++');
    // setTotalScore = _numberOfCorrectAnswers;
    print(_numberOfCorrectAnswers);
    print('++++++++++++++VVVVVVVVVVVV+++++++++++++++++++');
    _map = {
      'count': _count,
      'score': _numberOfCorrectAnswers,
    };

    return _map;
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
  fetchStudentsResults({@required int studentId}) {
    _httpRequestProvider
        .getStudentsResults(studentId: studentId)
        .then((resultsList) {
      _availableResults = resultsList;
      notifyListeners();
    });
  }

  List<Examination> getPastPapersOfASubject({@required int subjectId}) {
    List<Examination> _pastPapers = [];

    List<Examination> _filteredPastPapersBySubjectId = [];
    _availableSubjectList.forEach((subject) {
      subject.examinations.forEach((exam) {
        _availableResults.forEach((result) {
          if (exam.id == result.examId) {
            _pastPapers.add(exam);
          }
        });
      });
    });

    _filteredPastPapersBySubjectId = List<Examination>.from(
        _pastPapers.where((paper) => paper.subjectId == subjectId));

    return _filteredPastPapersBySubjectId;
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

  ///check if the examination has been done by this student
  Future<void> checkForExaminationVsStudentStatus(
      {@required int examId, @required int studentId}) async {
    _availableResults.forEach((result) {
      if (result.examId == examId && result.studentId == studentId) {
        _totalScore = result.score;
        _availableExaminations
            .firstWhere((exam) => exam.id == examId)
            .examStatus = ExamStatus.CLOSED;
        //change exam status
        return;
      }
    });
    notifyListeners();
  }

  ///post students results to server..
  /// sign up User
  Future<bool> postStudentResults(
      {@required int examId,
      @required int studentId,
      @required int score}) async {
    bool _isSuceess = false;
    final _result = Result(
      id: 0,
      examId: examId,
      score: score,
      studentId: studentId,
      candidates: null,
      date: null,
      position: null,
      student: null,
      subjectName: null,
    );
    await _httpRequestProvider
        .postRankResult(credentials: _result.toMap())
        .then((value) {
      print(value);
      _isSuceess = value;
    });

    notifyListeners();
    return _isSuceess;
  }

  //average results
  int averageResult() {
    int avg = 0;
    _availableResults.forEach((result) {
      avg += result.score;
    });
    return (avg / _availableResults.length).round();
  }

  int getScoreByExamId({@required examId}) {
    final _result =
        _availableResults.firstWhere((result) => result.examId == examId);

    return _result.score;
  }
}
mixin StudentModel on ConnectedExamModel {
  ///list of students of a particular guardian
  List<Student> _availableStudents = [];

  ///A selected student
  Student _selectedStudent;

  ///getter of list of students of a particular guardian
  List<Student> get availableStudents => _availableStudents;

  ///getter of selected student..
  Student get selectedStudent => _selectedStudent;

  void chooseAmImage() async {
    file = await ImagePicker.pickImage(source: ImageSource.gallery);
    _pickedImage = file;
// file = await ImagePicker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  //get the choosen Image.

  File get pickedImage {
    return _pickedImage;
  }

  ///setter for selected student
  set setSelectedStudent(Student student) {
    _selectedStudent = student;

    fetchStudentSubjects(gradeId: _selectedStudent.gradeId).then((hasData) {
      if (hasData) {
        //shift this logic
        if (_selectedStudent.gradeId == 1 || _selectedStudent.gradeId == 2) {
          _availableSubjectList = List<Subject>.from(
              _fetchedSubjectList.where((subject) => subject.id != 2));
        } else {
          _availableSubjectList = List<Subject>.from(
              _fetchedSubjectList.where((subject) => subject.id != 1));
        }
      }
    });

    notifyListeners();
  }

  fetchStudentsByGuardian({@required int userId}) async {
    await _httpRequestProvider
        .getStudentsAssociatedWithTheGuardian(userId: userId)
        .then((studentsList) {
      _availableStudents = studentsList;
      notifyListeners();
    });
  }

  postStudent({
    @required String name,
    @required String birthday,
    @required String schoolName,
    @required String gender,
    @required int gradeId,
    @required int userId,
    @required int districtId,
    @required int regionId,
  }) async {
    await _httpRequestProvider
        .postStudent(
            image: _pickedImage,
            name: name,
            birthday: birthday,
            districtId: districtId,
            gender: gender,
            gradeId: gradeId,
            regionId: regionId,
            schoolName: schoolName,
            userId: userId)
        .then((student) {
      if (student != null) {
        _availableStudents.add(student);
        notifyListeners();
      }
    });
  }
}

mixin GradeModel on ConnectedExamModel {
  //selected grade
  Grade _selectedGrade;

  ///list of grades
  List<Grade> _availableGrades = [];

  ///getter of list of grades
  List<Grade> get availableGrades => _availableGrades;

  ///getter for selected grade
  Grade get selectedGrade => _selectedGrade;

  ///setter for selecting a grade
  set setSelectedGrade(Grade grade) {
    _selectedGrade = grade;
    notifyListeners();
  }

  Grade getGradeById({@required int gradeId}) {
    Grade _grade = _availableGrades.firstWhere((grade) => grade.id == gradeId);
    return _grade;
  }

  initializeGrades() {
    _httpRequestProvider.getAllGrades().then((gradesList) {
      _availableGrades = gradesList;
      notifyListeners();
    });
  }
}

mixin GenderModel on ConnectedExamModel {
  //selected grade
  Gender _selectedGender;

  ///list of genders
  List<Gender> _availableGenders = [];

  ///getter of list of genders
  List<Gender> get availableGenders => _availableGenders;

  ///getter for selected genders
  Gender get selectedGender => _selectedGender;

  ///setter for selecting a gender
  set setSelectedGender(Gender gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  initializeGenders() {
    _availableGenders = genders;
    notifyListeners();
    // _httpRequestProvider.getAllGrades().then((gradesList) {
    //   _availableGrades = gradesList;
    //   notifyListeners();
    // });
  }
}
