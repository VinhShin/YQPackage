import 'dart:io';

class NetworkUtils {
  static Future<bool> checkInternetConnection() async {
    try {
      return InternetAddress.lookup('google.com').then((result) {
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
        return false;
      }).catchError((e) {
        return false;
      });
    } catch (_) {
      return false;
    }
  }
}

