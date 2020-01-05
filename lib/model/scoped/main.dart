
import 'package:scoped_model/scoped_model.dart';

import 'exam_connected_model.dart';

class MainModel extends Model
    with
        ConnectedExamModel,
        UtilityModel,
        UserModel,
        ExamModel,
        SubjectModel,
        ResultModel,
        StudentModel,
        GradeModel,
        GenderModel{}
