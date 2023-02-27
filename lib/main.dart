import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String urlString;
            if (Platform.isAndroid) {
              urlString = 'https://play.google.com/store/apps/details?id=com.ummahshop.app';
            } else if (Platform.isIOS) {
              urlString = 'https://apps.apple.com/app/id/1614235293';
            }
            print(urlString);
            if (urlString != null) {
              if (await canLaunch(urlString)) {
                await launch(urlString);
              }
            }
          },
          child: Text('PressMe'),
        ),
      ),
    ),
  ));
}
