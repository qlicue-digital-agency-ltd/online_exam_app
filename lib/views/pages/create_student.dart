import 'package:flutter/material.dart';
import 'package:online_exam_app/views/components/text_fields/normal_text_field.dart';

class CreateStudent extends StatelessWidget {
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _schoolNameFocusNode = FocusNode();
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _schoolNameTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                NoramalTextfield(
                  focusNode: _nameFocusNode,
                  hitText: 'eg. John Joe Martin',
                  keyboardType: TextInputType.text,
                  labelText: 'Name',
                  maxLines: 1,
                  message: 'Student\'s name required',
                  textEditingController: _nameEditingController,
                ),
                NoramalTextfield(
                  focusNode: _schoolNameFocusNode,
                  hitText: 'eg. Doris English Medium',
                  keyboardType: TextInputType.text,
                  labelText: 'School Name',
                  maxLines: 1,
                  message: 'school name required',
                  textEditingController: _schoolNameTextEditingController,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
