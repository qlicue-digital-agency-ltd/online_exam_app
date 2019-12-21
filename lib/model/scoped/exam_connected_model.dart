import 'package:online_exam_app/model/answer.dart';
import 'package:scoped_model/scoped_model.dart';

mixin ConnectedExamModel on Model {
  List<Answer> _answerList = ageList;

  List<Answer> get answerList => _answerList;
}
mixin UtilityModel on ConnectedExamModel {}
mixin LoginModel on ConnectedExamModel {}
mixin ExamModel on ConnectedExamModel {
  set setPreferredAnswer(id) {
    bool _status = !_answerList.firstWhere((race) => race.id == id).isSelected;
    _answerList.forEach((answer) {
      if (answer.id == id) {
        answer.isSelected = _status;
      } else {
        answer.isSelected = false;
      }
    });
    notifyListeners();
  }
}
