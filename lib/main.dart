import 'dart:io';

import 'package:device_info/device_info.dart';
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
              final info = await DeviceInfoPlugin().iosInfo.then((info) => info.systemVersion);
              print('$info');
              // urlString = 'https://play.google.com/store/apps/details?id=com.ummahshop.app';
            }
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
