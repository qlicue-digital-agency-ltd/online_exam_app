import 'package:flutter/material.dart';
import 'package:online_exam_app/model/service/url_laucher_service.dart';
import 'package:online_exam_app/views/components/cards/help_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  UrlLauncherService _launcherService = UrlLauncherService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              HelpCard(
                icon: Icons.call,
                onTap: () {
                  _launcherService.call('+255 715 123 456');
                },
                title: 'Call Us',
              ),
              SizedBox(
                height: 5,
              ),
              HelpCard(
                icon: Icons.message,
                onTap: () {
                  _launcherService.sendSms('+255 715 123 456');
                },
                title: 'Message',
              ),
              SizedBox(
                height: 5,
              ),
              HelpCard(
                icon: Icons.email,
                onTap: () {
                  _launcherService.sendEmail('info@spe.co.tz');
                },
                title: 'Email',
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(url) async {
    await launch(url);
  }
}
