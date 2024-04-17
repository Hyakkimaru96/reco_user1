import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'addresses.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE addresses(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phoneNumber TEXT, fullAddress TEXT)',
        );
      },
    );
  }

  Future<int> insertAddress(Map<String, dynamic> addressData) async {
    Database db = await database;
    return await db.insert('addresses', {
      'name': addressData['name'],
      'phoneNumber': addressData['phoneNumber'],
      'fullAddress': addressData['fullAddress'],
    });
  }

  Future<List<Map<String, dynamic>>> getAddresses() async {
    Database db = await database;
    return await db.query('addresses');
  }

  Future<bool> checkUserLoggedIn() async {
    try {
      List<Map<String, dynamic>> addresses = await getAddresses();
      return addresses.isNotEmpty; // Return true if user data exists, false otherwise
    } catch (e) {
      print('Error checking user login status: $e');
      return false; // Return false if an error occurs
    }
  }
  Future<String?> getUserName() async {
    try {
      Database db = await database;
      List<Map<String, dynamic>> result = await db.query('addresses', limit: 1);
      if (result.isNotEmpty) {
        return result.first['name'];
      } else {
        return null; // Return null if no user data found
      }
    } catch (e) {
      print('Error retrieving user name: $e');
      return null; // Return null if an error occurs
    }
  }
}
