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
              final info = await DeviceInfoPlugin().iosInfo.then((IosDeviceInfo info) => info.systemVersion);
              final version = int.tryParse(!info.contains('.') ? info : info.split('.').first);
              if (version >= 11) {
                urlString = 'itms-apps://itunes.apple.com/xy/app/foo/id%@1614235293';
              } else {
                urlString = 'itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@1614235293';
              }
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
