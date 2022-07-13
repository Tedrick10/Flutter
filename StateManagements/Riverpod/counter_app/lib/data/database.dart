// Flutter: Existing Libraries
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers
final databaseProvider = Provider<Database>((ref) => Database());

// Database: Fake Database Class
class Database {
  // Changable: Class Properties
  int? fakeDatabase;

  // Initialize Database
  Future<void> initDatabase() async {
    fakeDatabase = 0;
  }

  // Get User Data
  Future<String> getUserData() {
    return Future.delayed(const Duration(seconds: 3), () => "Thet Tun Kyaw");
  }

  // Action: Class Methods
  Future<int> increment() async {
    return Future.delayed(const Duration(seconds: 3), () {
      fakeDatabase = fakeDatabase! + 1;
      return fakeDatabase!;
    });
  }

  Future<int> decrement() async {
    return Future.delayed(const Duration(seconds: 3), () {
      fakeDatabase = fakeDatabase! - 1;
      return fakeDatabase!;
    });
  }
}
