import 'package:local_auth/local_auth.dart';

class Authentication {
  static final _auth = LocalAuthentication();

  static Future<bool> authenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authentication() async {
    try {
      if (!await authenticate()) return false;
      return await _auth.authenticate(localizedReason: "Log in to the app");
    } catch (e) {
      print('error $e');
      return false;
    }
  }
}
