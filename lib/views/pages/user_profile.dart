import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/buttons/gender_dropdown.dart';
import 'package:online_exam_app/views/components/text_fields/normal_text_field.dart';
import 'package:scoped_model/scoped_model.dart';

class UserProfile extends StatefulWidget {
  final MainModel model;

  const UserProfile({Key key, @required this.model}) : super(key: key);
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool _editProfile = false;
  FocusNode _nameFocusNode = FocusNode();

  FocusNode _emailFocusNode = FocusNode();

  TextEditingController _nameEditingController = TextEditingController();

  TextEditingController _emailTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    setState(() {
      if (widget.model.authenticatedUser.profile == null) {
        _editProfile = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Profile'),
            actions: <Widget>[
              IconButton(
                tooltip: _editProfile ? 'My Profile' : 'Edit Profile',
                icon: Icon(_editProfile ? Icons.person_outline : Icons.edit),
                onPressed: model.authenticatedUser.profile != null
                    ? () {
                        setState(() {
                          _editProfile = !_editProfile;
                        });
                      }
                    : null,
              )
            ],
          ),
          body: SingleChildScrollView(
            child: _editProfile
                ? Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
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
                            message: ' Name required',
                            textEditingController: _nameEditingController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          NoramalTextfield(
                            focusNode: _emailFocusNode,
                            hitText: 'eg. john@abc.com',
                            keyboardType: TextInputType.emailAddress,
                            labelText: 'Email',
                            maxLines: 1,
                            message: null,
                            textEditingController: _emailTextEditingController,
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
                                          color:
                                              Color(0xFF6078ea).withOpacity(.3),
                                          offset: Offset(0.0, 8.0),
                                          blurRadius: 8.0)
                                    ]),
                                height: 50,
                                child: Center(
                                    child: Text(
                                  'Save',
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
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/icon/male.jpg',
                              ),
                              radius: 50,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: Icon(Icons.person_outline,
                                  color: Colors.green),
                              title: Text(model.authenticatedUser.profile.name),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: Colors.green,
                              ),
                              title: Text("+" + model.authenticatedUser.phone),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(
                                Icons.email,
                                color: Colors.green,
                              ),
                              title:
                                  Text(model.authenticatedUser.profile.email),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(
                                Icons.supervised_user_circle,
                                color: Colors.green,
                              ),
                              title:
                                  Text(model.authenticatedUser.profile.gender),
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  _save(MainModel model) {
    if (_formKey.currentState.validate() && model.selectedGender != null) {
      model
          .postProfile(
              name: _nameEditingController.text,
              gender: model.selectedGender.name,
              userId: model.authenticatedUser.id,
              email: _emailTextEditingController.text)
          .then((profile) {
        if (profile != null) {
          setState(() {
            _editProfile = !_editProfile;
          });
        }
      });
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
