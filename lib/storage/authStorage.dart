import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {
  final storage = FlutterSecureStorage();

  Future<void> storeAuthToken(String token) async {
    await storage.write(key: 'token', value: token);
  }
}
