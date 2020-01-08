import 'package:flutter/material.dart';
import 'package:online_exam_app/model/service/url_laucher_service.dart';


class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  UrlLauncherService _launcherService = UrlLauncherService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.green]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF6078ea).withOpacity(.3),
                          offset: Offset(0.0, 8.0),
                          blurRadius: 8.0)
                    ]),
                child: ListTile(
                  onTap: () {
                    print('object');
                    _launcherService.call('+255 715 123 456');
                  },
                  leading: Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                  title: Text('Call Us'),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.green]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF6078ea).withOpacity(.3),
                          offset: Offset(0.0, 8.0),
                          blurRadius: 8.0)
                    ]),
                child: ListTile(
                  onTap: () {
                    print('object');
                    _launcherService.sendSms('+255 715 123 456');
                  },
                  leading: Icon(
                    Icons.message,
                    color: Colors.green,
                  ),
                  title: Text('Message'),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.green]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF6078ea).withOpacity(.3),
                          offset: Offset(0.0, 8.0),
                          blurRadius: 8.0)
                    ]),
                child: ListTile(
                  onTap: () {
                    print('object');
                    _launcherService.sendEmail('info@spe.co.tz');
                  },
                  leading: Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                  title: Text('Email'),
                ),
              ),
              // HelpCard(
              //   icon: Icons.email,
              //   onTap: () {
              //     _launcherService.sendEmail('info@spe.co.tz');
              //   },
              //   title: 'Email',
              // )
            ],
          ),
        ),
      ),
    );
  }
}
