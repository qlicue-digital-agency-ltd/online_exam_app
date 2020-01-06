import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/buttons/date_picker.dart';
import 'package:online_exam_app/views/components/buttons/gender_dropdown.dart';
import 'package:online_exam_app/views/components/buttons/grade_dropdown.dart';
import 'package:online_exam_app/views/components/text/header_text.dart';
import 'package:online_exam_app/views/components/text_fields/normal_text_field.dart';
import 'package:scoped_model/scoped_model.dart';

const String MIN_DATETIME = '1900-01-01';
const String MAX_DATETIME = '2100-01-01';
const String INIT_DATETIME = '2019-01-01';

class CreateStudent extends StatefulWidget {
  @override
  _CreateStudentState createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {
  FocusNode _nameFocusNode = FocusNode();

  FocusNode _schoolNameFocusNode = FocusNode();

  TextEditingController _nameEditingController = TextEditingController();

  TextEditingController _schoolNameTextEditingController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _format = 'yyyy-MMMM-dd';

  DateTime _birthday;
  bool _showTitle = true;

  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Add Student'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    HeaderText(
                      title: 'Personal Information',
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap: () {
                          model.chooseAmImage();
                        },
                        child: CircleAvatar(
                          backgroundImage: model.pickedImage == null
                              ? AssetImage('assets/icon/male.jpg')
                              : FileImage(
                                  model.pickedImage,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    NoramalTextfield(
                      focusNode: _nameFocusNode,
                      hitText: 'eg. John Joe Martin',
                      keyboardType: TextInputType.text,
                      labelText: 'Name',
                      maxLines: 1,
                      message: 'Student\'s name required',
                      textEditingController: _nameEditingController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GenderDropdown(
                      items: model.availableGenders,
                      onChange: (gender) {
                        model.setSelectedGender = gender;
                      },
                      value: model.selectedGender,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDateDropdown(
                      birthday: _birthday,
                      model: model,
                      onTap: () {
                        print('object');
                        _showDatePicker();
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    HeaderText(
                      title: 'School Information',
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    NoramalTextfield(
                      focusNode: _schoolNameFocusNode,
                      hitText: 'eg. Doris English Medium',
                      keyboardType: TextInputType.text,
                      labelText: 'School Name',
                      maxLines: 1,
                      message: 'school name required',
                      textEditingController: _schoolNameTextEditingController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GradeDropdown(
                      items: model.availableGrades,
                      onChange: (grade) {
                        model.setSelectedGrade = grade;
                      },
                      value: model.selectedGrade,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GenderDropdown(
                      title: 'Region',
                      items: model.availableGenders,
                      onChange: (gender) {
                        model.setSelectedGender = gender;
                      },
                      value: model.selectedGender,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GenderDropdown(
                      title: 'District',
                      items: model.availableGenders,
                      onChange: (gender) {
                        model.setSelectedGender = gender;
                      },
                      value: model.selectedGender,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          _save(model);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              gradient: LinearGradient(colors: [
                                Colors.green[300],
                                Colors.green[700],
                              ]),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          height: 50,
                          child: Center(
                              child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Display date picker.
  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
        confirm: Text('Done', style: TextStyle(color: Colors.cyan)),
        cancel: Text('cancel', style: TextStyle(color: Colors.red)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: _birthday,
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          _birthday = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _birthday = dateTime;
        });
      },
    );
  }

  _save(MainModel model) {
    if (_formKey.currentState.validate() &&
        _birthday != null &&
        model.selectedGender != null &&
        model.selectedGrade != null) {
      model.postStudent(
          name: _nameEditingController.text,
          birthday: _birthday.toString(),
          schoolName: _schoolNameTextEditingController.text,
          districtId: 1,
          gender: model.selectedGender.name,
          regionId: 1,
          gradeId: model.selectedGrade.id,
          userId: model.authenticatedUser.id);
      Navigator.pop(context);
    } else {
      model.showInSnackBar(
          color: Colors.red,
          context: context,
          icon: Icons.error,
          scaffoldKey: _scaffoldKey,
          title: 'Fill all required field');
    }
  }
}
